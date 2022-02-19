import 'package:get/get_utils/src/extensions/internacionalization.dart';

String? validateIntText(String? value) {
  if (value == null || value.isEmpty) {
    return 'converter_validation_required'.tr;
  } else if (value.contains(RegExp(r'\D'))) {
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
