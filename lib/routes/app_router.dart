import 'package:book_pulse_app/features/home/presentation/views/home_view.dart';
import 'package:book_pulse_app/features/splash/presentation/views/splash_view.dart';
import 'package:book_pulse_app/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

/// Singleton GoRouter instance for the entire app.
/// Add new routes inside [_routes] as the app grows.
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: false,
    routes: _routes,
  );

  static final List<RouteBase> _routes = [
    GoRoute(
      path: AppRoutes.splash,
      name: 'splash',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: AppRoutes.home,
      name: 'home',
      builder: (context, state) => const HomeView(),
    ),
  ];
}
