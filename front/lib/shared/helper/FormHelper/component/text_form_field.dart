import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front/shared/helper/FormHelper/form.dart';

class CustomTextFormField extends CustomFormField<String> {
  CustomTextFormField({
    super.key,
    required String fieldName,
    String? initialValue,
    FocusNode? focusNode,
    InputDecoration? decoration = const InputDecoration(),
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    @Deprecated(
      'Use `contextMenuBuilder` instead. '
      'This feature was deprecated after v3.3.0-0.5.pre.',
    )
    ToolbarOptions? toolbarOptions,
    bool? showCursor,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool enableSuggestions = true,
    MaxLengthEnforcement? maxLengthEnforcement,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    this.onChanged,
    GestureTapCallback? onTap,
    TapRegionCallback? onTapOutside,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    super.onSaved,
    super.validator,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    double cursorWidth = 2.0,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool? enableInteractiveSelection,
    TextSelectionControls? selectionControls,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    AutovalidateMode? autovalidateMode,
    ScrollController? scrollController,
    super.restorationId,
    bool enableIMEPersonalizedLearning = true,
    MouseCursor? mouseCursor,
    EditableTextContextMenuBuilder? contextMenuBuilder =
        _defaultContextMenuBuilder,
    SpellCheckConfiguration? spellCheckConfiguration,
    TextMagnifierConfiguration? magnifierConfiguration,
    UndoHistoryController? undoController,
    AppPrivateCommandCallback? onAppPrivateCommand,
    bool? cursorOpacityAnimates,
    ui.BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight,
    ui.BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ContentInsertionConfiguration? contentInsertionConfiguration,
    Clip clipBehavior = Clip.hardEdge,
    bool scribbleEnabled = true,
    bool canRequestFocus = true,
  })  : assert(initialValue == null),
        assert(obscuringCharacter.length == 1),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        assert(
          !expands || (maxLines == null && minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(!obscureText || maxLines == 1,
            'Obscured fields cannot be multiline.'),
        assert(maxLength == null ||
            maxLength == TextField.noMaxLength ||
            maxLength > 0),
        super(
          fieldName: fieldName,
          initialValue: (initialValue ?? ''),
          enabled: enabled ?? decoration?.enabled ?? true,
          builder: (CustomFormFieldState<String> field) {
            final _CustomTextFormFieldState state = field as _CustomTextFormFieldState;
            final InputDecoration effectiveDecoration = (decoration ??
                    const InputDecoration())
                .applyDefaults(Theme.of(field.context).inputDecorationTheme);
            void onChangedHandler(String value) {
              field.didChange(value);
              onChanged?.call(value);
            }

            return UnmanagedRestorationScope(
              bucket: field.bucket,
              child: TextField(
                restorationId: restorationId,
                focusNode: focusNode,
                decoration:
                    effectiveDecoration.copyWith(errorText: field.errorText),
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                style: style,
                strutStyle: strutStyle,
                textAlign: textAlign,
                textAlignVertical: textAlignVertical,
                textDirection: textDirection,
                textCapitalization: textCapitalization,
                autofocus: autofocus,
                toolbarOptions: toolbarOptions,
                readOnly: readOnly,
                showCursor: showCursor,
                obscuringCharacter: obscuringCharacter,
                obscureText: obscureText,
                autocorrect: autocorrect,
                smartDashesType: smartDashesType ??
                    (obscureText
                        ? SmartDashesType.disabled
                        : SmartDashesType.enabled),
                smartQuotesType: smartQuotesType ??
                    (obscureText
                        ? SmartQuotesType.disabled
                        : SmartQuotesType.enabled),
                enableSuggestions: enableSuggestions,
                maxLengthEnforcement: maxLengthEnforcement,
                maxLines: maxLines,
                minLines: minLines,
                expands: expands,
                maxLength: maxLength,
                onChanged: onChangedHandler,
                onTap: onTap,
                onTapOutside: onTapOutside,
                onEditingComplete: onEditingComplete,
                onSubmitted: onFieldSubmitted,
                inputFormatters: inputFormatters,
                enabled: enabled ?? decoration?.enabled ?? true,
                cursorWidth: cursorWidth,
                cursorHeight: cursorHeight,
                cursorRadius: cursorRadius,
                cursorColor: cursorColor,
                scrollPadding: scrollPadding,
                scrollPhysics: scrollPhysics,
                keyboardAppearance: keyboardAppearance,
                enableInteractiveSelection:
                    enableInteractiveSelection ?? (!obscureText || !readOnly),
                selectionControls: selectionControls,
                buildCounter: buildCounter,
                autofillHints: autofillHints,
                scrollController: scrollController,
                enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
                mouseCursor: mouseCursor,
                contextMenuBuilder: contextMenuBuilder,
                spellCheckConfiguration: spellCheckConfiguration,
                magnifierConfiguration: magnifierConfiguration,
                undoController: undoController,
                onAppPrivateCommand: onAppPrivateCommand,
                cursorOpacityAnimates: cursorOpacityAnimates,
                selectionHeightStyle: selectionHeightStyle,
                selectionWidthStyle: selectionWidthStyle,
                dragStartBehavior: dragStartBehavior,
                contentInsertionConfiguration: contentInsertionConfiguration,
                clipBehavior: clipBehavior,
                scribbleEnabled: scribbleEnabled,
                canRequestFocus: canRequestFocus,
              ),
            );
          },
        );

  final ValueChanged<String>? onChanged;
  static Widget _defaultContextMenuBuilder(
      BuildContext context, EditableTextState editableTextState) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  @override
  CustomFormFieldState<String> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends CustomFormFieldState<String> {

}
