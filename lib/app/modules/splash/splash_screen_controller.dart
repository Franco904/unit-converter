import 'package:get/get.dart';
import 'package:tutorial_inicial/app/core/utils/session.dart';
import 'package:tutorial_inicial/app/modules/category_list/category_list_page.dart';
import 'package:tutorial_inicial/app/pages/welcome/welcome_page.dart';

class SplashScreenController extends GetxController {
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    Future.delayed(Duration(seconds: 2), () async {
      final firstAccess = await checkFirstAccess();
      await writeFirstAccess(false);
      isLoading.value = false;

      // Não está indo direto para a lista de categorias (controller é deletado)
      // Usar um GetxService no lugar
      Get.offAll<void>(() => firstAccess ? WelcomePage() : CategoryListPage());
    });
    super.onInit();
  }
}
