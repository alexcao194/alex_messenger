import 'package:alex_messenger/app/authentication/presentation/screens/login_screen.dart';
import 'package:alex_messenger/app/authentication/presentation/screens/signup_screen.dart';
import 'package:alex_messenger/app/home/presentation/screens/home_screen.dart';
import 'package:alex_messenger/app/profile/presentation/screens/profile_screen.dart';
import 'package:alex_messenger/splash_screen.dart';
import 'package:flutter/material.dart';
class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: const Center(
                child: Text('Fallback')
            ),
        ));
    }
  }

  static push(Widget widget) {
    navigatorKey.currentState?.push(MaterialPageRoute(builder: (_) => widget));
  }

  static pushReplacement(Widget widget) {
    navigatorKey.currentState?.pushReplacement(MaterialPageRoute(builder: (_) => widget));
  }
}

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String profile = '/profile';
}