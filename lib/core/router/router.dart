import 'package:go_router/go_router.dart';
import 'package:isla_vigu/core/router/routes.dart';
import 'package:isla_vigu/features/authentication/presentation/pages/auth_page.dart';
import 'package:isla_vigu/features/authentication/presentation/pages/home_page.dart';
import 'package:isla_vigu/features/splash/presentation/pages/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.splashRoute,
        builder: (context, state) => SplashScreen(),
      ),
      //
      GoRoute(
        path: AppRoutes.authRoute,
        builder: (context, state) => AuthPage(),
      ),
      //
      GoRoute(
        path: AppRoutes.homeRoute,
        builder: (context, state) => HomePage(),
      )
    ],
  );
}
