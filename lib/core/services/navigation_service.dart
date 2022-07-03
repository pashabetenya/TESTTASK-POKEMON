// link to packages from the pages.
import 'package:application/ui/pages/autentity/forgot_password_page.dart';
import 'package:application/ui/pages/home/home_page.dart';
import 'package:application/ui/pages/autentity/login_page.dart';
import 'package:application/ui/pages/autentity/register_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum Pages {
  forgot,
  login,
  register,
  home,
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = Get.key;

  Future<dynamic> navigateTo(Pages page) {
    final route = _generateRoute(page);
    return navigatorKey.currentState!
        .pushAndRemoveUntil(route, (context) => false);
  }

  Future<dynamic> navigateWithReplacementTo(Pages page) {
    final route = _generateRoute(page);
    return navigatorKey.currentState!.pushReplacement(route);
  }

  void goBack() {
    navigatorKey.currentState!.pop();
  }

  Route<dynamic> _generateRoute(Pages page) {
    Widget resultPage;

    switch (page) {
      case Pages.forgot:
        resultPage = const ForgotPasswordPage();
        break;
      case Pages.login:
        resultPage = const LoginPage();
        break;
      case Pages.register:
        resultPage = const RegisterPage();
        break;
      case Pages.home:
        resultPage = const HomePage();
        break;

      default:
        resultPage = const LoginPage();
        break;
    }

    return _getRoute(
      resultPage,
      settings: const RouteSettings(),
    );
  }

  Route<dynamic> _getRoute(Widget widget, {required RouteSettings settings}) {
    return CupertinoPageRoute(builder: (_) => widget, settings: settings);
  }
}
