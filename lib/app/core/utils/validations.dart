import 'package:get/get.dart';

String? validateIntText(String? value) {
  value = value?.replaceAll(',', '.');

  if (value == null || value.isEmpty) {
    return 'converter_validation_required'.tr;
  } else if (num.tryParse(value) == null) {
    return 'converter_validation_invalid'.tr;
  }
  return null;
}

String? validateDropdown(String? dropdown) {
  if (dropdown == null || dropdown.isEmpty) {
    return 'converter_validation_required'.tr;
  }
  return null;
}
