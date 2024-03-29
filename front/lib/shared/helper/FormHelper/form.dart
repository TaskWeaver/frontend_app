import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:front/shared/helper/FormHelper/interface/form_auto_validation_mode.dart';
import 'package:front/shared/helper/FormHelper/interface/form_validate_function.dart';

const Duration _kIOSAnnouncementDelayDuration = Duration(seconds: 1);

// TODO: implement the case when [AutoValidationMode] is on onUnFocus
class CustomForm extends StatefulWidget {
  const CustomForm({
    super.key,
    required this.child,
    this.canPop = true,
    this.onPopInvoked,
    this.onChanged,
  });

  static CustomFormState? maybeOf(BuildContext context) {
    var scope = context.dependOnInheritedWidgetOfExactType<_CustomFormScope>();
    return scope?._formState;
  }

  static CustomFormState of(BuildContext context) {
    var formState = maybeOf(context);
    assert(() {
      if (formState == null) {
        throw FlutterError(
          'CustomForm.of() was called with a context that does not contain a CustomForm widget.\n'
          'No CustomForm widget ancestor could be found starting from the context that '
          'was passed to CustomForm.of(). This can happen because you are using a widget '
          'that looks for a CustomForm ancestor, but no such ancestor exists.\n'
          'The context used was:\n'
          '  $context',
        );
      }
      return true;
    }());
    return formState!;
  }

  final Widget child;

  final bool? canPop;

  final PopInvokedCallback? onPopInvoked;

  final VoidCallback? onChanged;

  @override
  CustomFormState createState() => CustomFormState();
}

class CustomFormState extends State<CustomForm> {
  int _generation = 0;
  bool _hasInteractedByUser = false;
  final Map<String, CustomFormFieldState<dynamic>> _fields =
      <String, CustomFormFieldState<dynamic>>{};

  Map<String, CustomFormFieldState> get fields => _fields;

  void _fieldDidChange() {
    widget.onChanged?.call();

    for (var feild in _fields.values) {
      _hasInteractedByUser =
          _hasInteractedByUser || feild._hasInteractedByUser.value;
    }
    _forceRebuild();
  }

  void _forceRebuild() {
    setState(() {
      ++_generation;
    });
  }

  void _register(CustomFormFieldState<dynamic> field) {
    _fields.update(field.widget.fieldName, (value) => field,
        ifAbsent: () => field);
  }

  void _unregister(CustomFormFieldState<dynamic> field) {
    _fields.remove(field);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.canPop ?? true,
      onPopInvoked: widget.onPopInvoked,
      child: _CustomFormScope(
        formState: this,
        generation: _generation,
        child: widget.child,
      ),
    );
  }

  void save() {
    _fields.forEach((key, value) {
      value.save();
    });
  }

  void reset() {
    _fields.forEach((key, value) {
      value.reset();
    });
    _hasInteractedByUser = false;
    _fieldDidChange();
  }

  bool validate(AutoValidationMode? autoValidationMode) {
    _hasInteractedByUser = true;
    _forceRebuild();
    return _validate(autoValidationMode);
  }

  bool _validate(AutoValidationMode? autoValidationMode) {
    var hasError = false;
    var errorMessage = '';

    //Call validate functions of every field
    _fields.forEach((key, field) {
      hasError = !field.validate(autoValidationMode) || hasError;
      errorMessage += field.errorText ?? '';
    });

    if (errorMessage.isNotEmpty) {
      var directionality = Directionality.of(context);
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        unawaited(Future<void>(() async {
          await Future<void>.delayed(_kIOSAnnouncementDelayDuration);
          await SemanticsService.announce(errorMessage, directionality,
              assertiveness: Assertiveness.assertive);
        }));
      } else {
        SemanticsService.announce(errorMessage, directionality,
            assertiveness: Assertiveness.assertive);
      }
    }
    return !hasError;
  }
}

class _CustomFormScope extends InheritedWidget {
  const _CustomFormScope({
    required super.child,
    required CustomFormState formState,
    required int generation,
  })  : _formState = formState,
        _generation = generation;

  final CustomFormState _formState;

  final int _generation;

  CustomForm get form => _formState.widget;

  @override
  bool updateShouldNotify(_CustomFormScope old) =>
      _generation != old._generation;
}

typedef CustomFormFieldValidator<T> = String? Function(T? value);

typedef CustomFormFieldSetter<T> = void Function(T? newValue);

typedef CustomFormFieldBuilder<T> = Widget Function(
    CustomFormFieldState<T> field);

class CustomFormField<T> extends StatefulWidget {
  const CustomFormField({
    super.key,
    required this.fieldName,
    required this.validator,
    required this.builder,
    this.onSaved,
    this.initialValue,
    this.enabled = true,
    this.restorationId,
  });

  final String fieldName;

  final CustomFormFieldSetter<T>? onSaved;

  final List<ValidateFuncList>? validator;

  final CustomFormFieldBuilder<T> builder;

  final T? initialValue;

  final bool enabled;

  final String? restorationId;

  @override
  CustomFormFieldState<T> createState() => CustomFormFieldState<T>();
}

class CustomFormFieldState<T> extends State<CustomFormField<T>>
    with RestorationMixin {
  late T? _value = widget.initialValue;
  final RestorableStringN _errorText = RestorableStringN(null);
  final RestorableBool _hasInteractedByUser = RestorableBool(false);

  T? get value => _value;

  String? get errorText => _errorText.value;

  bool get hasError => _errorText.value != null;

  /// Whether the field has been interacted with by the user. 
  bool get hasInteractedByUser => _hasInteractedByUser.value;

  /// Whether the validation is not satisfied
  List<bool> validatorStatus = [];

  void save() {
    widget.onSaved?.call(value);
  }

  void reset() {
    setState(() {
      _value = widget.initialValue;
      _hasInteractedByUser.value = false;
      _errorText.value = null;
    });
    CustomForm.maybeOf(context)?._fieldDidChange();
  }

  bool validate(AutoValidationMode? autoValidationMode) {
    setState(() {
      _validate(autoValidationMode);
    });
    return !hasError;
  }

  String? _validate(AutoValidationMode? autoValidationMode) {
    /// validate everything if [autoValidationMode] is null]
    if (widget.validator?.isEmpty ?? false) return _errorText.value = null;
    var index = -1;
    var invalidValidation = widget.validator?.firstWhere((option) {
      index++;
      if (validatorStatus[index] != true &&
          autoValidationMode != null &&
          option.autoValidationMode != autoValidationMode) {
        return false;
      }
      /// Validatate if [validatorStatus] is true
      if (option.validateFunc(_value) == true) {
        validatorStatus[index] = false;
        return false;
      } else {
        validatorStatus[index] = true;
        return true;
      }
    },
        orElse: () => ValidateFuncList(
              validateFunc: (val) {
                return false;
              },
              validateMessage: '-1',
              autoValidationMode: AutoValidationMode.disabled,
            ));

    if (invalidValidation?.validateMessage == '-1') {
      return _errorText.value = null;
    }
    _errorText.value = invalidValidation?.validateMessage;

    return _errorText.value;
  }

  void didChange(T? value) {
    setState(() {
      _value = value;
      _hasInteractedByUser.value = true;
    });
    CustomForm.maybeOf(context)?._fieldDidChange();
  }

  @protected
  void setValue(T? value) {
    _value = value;
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_errorText, 'error_text');
    registerForRestoration(_hasInteractedByUser, 'has_interacted_by_user');
  }

  @override
  void deactivate() {
    CustomForm.maybeOf(context)?._unregister(this);
    super.deactivate();
  }

  @override
  void dispose() {
    _errorText.dispose();
    _hasInteractedByUser.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // register field to parent form
    Future.delayed(Duration.zero, () {
      CustomForm.maybeOf(context)?._register(this);
    });
    if (widget.validator != null) {
      for (var validator in widget.validator!) {
        validatorStatus.add(validator.status);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // validate field every time the field is built
    if (widget.enabled) {
      _validate(AutoValidationMode.always);
      if (_hasInteractedByUser.value) {
        _validate(AutoValidationMode.onUserInteraction);
      }
    }
    return widget.builder(this);
  }
}
