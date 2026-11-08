import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:wayve/core/router/app_router_data.dart';
import 'package:wayve/core/router/go_router_refresh_stream.dart';
import 'package:wayve/features/authentication/presentation/bloc/auth_bloc.dart';

@singleton
class AppRouter {
  final AuthBloc _authBloc;

  AppRouter({required this._authBloc});

  late final GoRouter goRouter = GoRouter(
    initialLocation: const HomeRoute().location,
    refreshListenable: GoRouterRefreshStream(_authBloc.stream),
    routes: $appRoutes,
    redirect: (BuildContext context, GoRouterState state) {
      final authState = _authBloc.state;
      final isLoggingIn = state.matchedLocation == const LoginRoute().location;

      // 1. Hold navigation while checking local session on startup
      if (authState is AuthInitial || authState is AuthLoading) {
        return null;
      }

      final isAuthenticated = authState is AuthSuccess;

      // 2. If unauthenticated or failed, redirect to Login
      if (!isAuthenticated && !isLoggingIn) {
        return const LoginRoute().location;
      }

      // 3. If authenticated and currently on Login, redirect to Home
      if (isAuthenticated && isLoggingIn) {
        return const HomeRoute().location;
      }

      return null;
    },
  );
}
