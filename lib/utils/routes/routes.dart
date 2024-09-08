import 'package:News_API/utils/routes/routes_name.dart';
import 'package:News_API/view/splash_view.dart';
import 'package:get/get.dart';

class Routes {
  static appRoutes() => [
        GetPage(
            name: RouteNames.splashScreen,
            page: () => const SplashView(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade)
      ];
}
