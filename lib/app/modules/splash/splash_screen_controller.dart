import 'package:get/get.dart';
import 'package:tutorial_inicial/app/core/utils/session.dart';
import 'package:tutorial_inicial/app/routes/routes.dart';

class SplashScreenController extends GetxController {
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () async {
      final firstAccess = await checkFirstAccess();
      isLoading.value = false;

      Get.offAllNamed(firstAccess ? Routes.WELCOME : Routes.CATEGORY);
    });
    super.onInit();
  }
}
