import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front/shared/atom/checkbox_form_field.dart';
import 'package:front/shared/atom/checkbox_group_form_field.dart';
import 'package:front/shared/helper/FormHelper/form.dart';
import 'package:front/shared/helper/FormHelper/form_validate_builder.dart';

void main() {
  group('CheckboxGroupFormField', () {
    var agreeAllCheckboxKey = const Key('agreeAll');
    var childrenNumber = 5;
    var childrenCheckboxFormField = List.generate(childrenNumber, (index) {
      return CheckboxFormField(
        key: Key('checkbox$index'),
        fieldName: 'checkbox$index',
        title: 'Checkbox $index',
        value: false,
        validator: FieldValidationBuilder.field('checkbox$index').build(),
      );
    });
    var agreeAllCheckboxFormField = CheckboxFormField(
      fieldName: 'agreeAll',
      key: agreeAllCheckboxKey,
      title: 'Agree All',
      value: false,
      validator: FieldValidationBuilder.field('agreeAll').build(),
    );
    var checkboxGroupFormField = CheckboxGroupFormField(
      agreeAllCheckBox: agreeAllCheckboxFormField,
      checkBoxes: childrenCheckboxFormField,
    );

    testWidgets('should render correctly', (widgetTester) async {
      await widgetTester.pumpWidget(MaterialApp(
          home: Scaffold(body: CustomForm(child: checkboxGroupFormField))));
      await widgetTester.pumpAndSettle();

      expect(find.byKey(agreeAllCheckboxKey), findsOneWidget);
      expect(find.byType(CheckboxFormField), findsNWidgets(childrenNumber + 1));
    });

    testWidgets(
        'should check all checkboxes when agree all checkbox is checked',
        (widgetTester) async {
      var formKey = GlobalKey<CustomFormState>();

      await widgetTester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: CustomForm(key: formKey, child: checkboxGroupFormField))));
      
      //expect every checkbox to be unchecked
      expect(
          find.byType(CheckboxFormField).evaluate().every((element) {
            return !(element.widget as CheckboxFormField).value;
          }),
          true);

      // check agreeAll checkbox
      await widgetTester.tap(find.byType(Checkbox).first);

      await widgetTester.pump();

      // expect every checkbox to be checked
      expect(
          find.byType(CheckboxFormField).evaluate().every((element) {
            return (element.widget as CheckboxFormField).value;
          }),
          true);

      // uncheck agreeAll checkbox
      await widgetTester.tap(find.byType(Checkbox).first);

      await widgetTester.pumpAndSettle();

      // expect every checkbox to be unchecked
      expect(
          find.byType(CheckboxFormField).evaluate().every((element) {
            return !(element.widget as CheckboxFormField).value;
          }),
          true);
    });
    testWidgets(
        'should check agreeAll checkbox when all checkboxes are checked',
        (widgetTester) async {
      var formKey = GlobalKey<CustomFormState>();

      await widgetTester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: CustomForm(key: formKey, child: checkboxGroupFormField))));
      
      //expect every checkbox including agreeAll checkbox to be unchecked
      expect(
          find.byType(CheckboxFormField).evaluate().every((element) {
            return !(element.widget as CheckboxFormField).value;
          }),
          true);

      // check all checkboxes
      for (var i = 1; i <= childrenNumber; i++) {
        await widgetTester.tap(find.byType(Checkbox).at(i));
      }

      await widgetTester.pumpAndSettle();
      
      // expect every checkbox including agreeAll checkbox to be checked
      expect(
          find.byType(CheckboxFormField).evaluate().every((element) {
            return (element.widget as CheckboxFormField).value;
          }),
          true);
    });
  });
}
