import 'package:go_router/go_router.dart';
import 'package:isla_vigu/core/router/routes.dart';
import 'package:isla_vigu/features/authentication/presentation/pages/auth_screen.dart';
import 'package:isla_vigu/features/home/presentation/pages/home_screen.dart';
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
        builder: (context, state) => AuthScreen(),
      ),
      //
      GoRoute(
        path: AppRoutes.homeRoute,
        builder: (context, state) => HomeScreen(),
      )
    ],
  );
}
