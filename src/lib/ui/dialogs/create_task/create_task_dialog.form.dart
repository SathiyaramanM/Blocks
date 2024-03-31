// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String TitleValueKey = 'title';
const String DescriptionValueKey = 'description';

final Map<String, TextEditingController>
    _CreateTaskDialogTextEditingControllers = {};

final Map<String, FocusNode> _CreateTaskDialogFocusNodes = {};

final Map<String, String? Function(String?)?> _CreateTaskDialogTextValidations =
    {
  TitleValueKey: null,
  DescriptionValueKey: null,
};

mixin $CreateTaskDialog {
  TextEditingController get titleController =>
      _getFormTextEditingController(TitleValueKey);
  TextEditingController get descriptionController =>
      _getFormTextEditingController(DescriptionValueKey);

  FocusNode get titleFocusNode => _getFormFocusNode(TitleValueKey);
  FocusNode get descriptionFocusNode => _getFormFocusNode(DescriptionValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_CreateTaskDialogTextEditingControllers.containsKey(key)) {
      return _CreateTaskDialogTextEditingControllers[key]!;
    }

    _CreateTaskDialogTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CreateTaskDialogTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CreateTaskDialogFocusNodes.containsKey(key)) {
      return _CreateTaskDialogFocusNodes[key]!;
    }
    _CreateTaskDialogFocusNodes[key] = FocusNode();
    return _CreateTaskDialogFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    titleController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    titleController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          TitleValueKey: titleController.text,
          DescriptionValueKey: descriptionController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _CreateTaskDialogTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CreateTaskDialogFocusNodes.values) {
      focusNode.dispose();
    }

    _CreateTaskDialogTextEditingControllers.clear();
    _CreateTaskDialogFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get titleValue => this.formValueMap[TitleValueKey] as String?;
  String? get descriptionValue =>
      this.formValueMap[DescriptionValueKey] as String?;

  set titleValue(String? value) {
    this.setData(
      this.formValueMap..addAll({TitleValueKey: value}),
    );

    if (_CreateTaskDialogTextEditingControllers.containsKey(TitleValueKey)) {
      _CreateTaskDialogTextEditingControllers[TitleValueKey]?.text =
          value ?? '';
    }
  }

  set descriptionValue(String? value) {
    this.setData(
      this.formValueMap..addAll({DescriptionValueKey: value}),
    );

    if (_CreateTaskDialogTextEditingControllers.containsKey(
        DescriptionValueKey)) {
      _CreateTaskDialogTextEditingControllers[DescriptionValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasTitle =>
      this.formValueMap.containsKey(TitleValueKey) &&
      (titleValue?.isNotEmpty ?? false);
  bool get hasDescription =>
      this.formValueMap.containsKey(DescriptionValueKey) &&
      (descriptionValue?.isNotEmpty ?? false);

  bool get hasTitleValidationMessage =>
      this.fieldsValidationMessages[TitleValueKey]?.isNotEmpty ?? false;
  bool get hasDescriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey]?.isNotEmpty ?? false;

  String? get titleValidationMessage =>
      this.fieldsValidationMessages[TitleValueKey];
  String? get descriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey];
}

extension Methods on FormStateHelper {
  setTitleValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TitleValueKey] = validationMessage;
  setDescriptionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DescriptionValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    titleValue = '';
    descriptionValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      TitleValueKey: getValidationMessage(TitleValueKey),
      DescriptionValueKey: getValidationMessage(DescriptionValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _CreateTaskDialogTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _CreateTaskDialogTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      TitleValueKey: getValidationMessage(TitleValueKey),
      DescriptionValueKey: getValidationMessage(DescriptionValueKey),
    });
