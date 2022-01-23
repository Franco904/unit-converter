import 'package:flutter/cupertino.dart';

bool isDeviceSmallerThan360dp(BuildContext context) {
  return MediaQuery.of(context).size.width < 360;
}

bool isDeviceSmallerThan600dp(BuildContext context) {
  return MediaQuery.of(context).size.width < 600;
}

bool isDeviceSmallerThan905dp(BuildContext context) {
  return MediaQuery.of(context).size.width < 905;
}
