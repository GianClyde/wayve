//branch identifiers

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wayve/core/router/main_navigation_shell.dart';
import 'package:wayve/features/authentication/presentation/pages/login_page.dart';
import 'package:wayve/features/events/presentation/screen/events_page.dart';
import 'package:wayve/features/groups/presentation/screen/groups_page.dart';
import 'package:wayve/features/home/presentation/screen/home_page.dart';

part 'app_router_data.g.dart';

@TypedStatefulShellRoute<AppShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    //home
    TypedStatefulShellBranch<HomeBranchData>(
      routes: <TypedRoute<RouteData>>[TypedGoRoute<HomeRoute>(path: '/')],
    ),
    //Groups
    TypedStatefulShellBranch<GroupsBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<GroupsRoute>(path: '/groups'),
      ],
    ),
    //Events
    TypedStatefulShellBranch<EventsBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<EventsRoute>(path: '/events'),
      ],
    ),
  ],
)
class AppShellRouteData extends StatefulShellRouteData {
  const AppShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    // Reuses the MainNavigationShell widget containing the Scaffold & BottomNavigationBar
    return MainNavigationShell(navigationShell: navigationShell);
  }
}

// identifier branc
class HomeBranchData extends StatefulShellBranchData {
  const HomeBranchData();
}

class GroupsBranchData extends StatefulShellBranchData {
  const GroupsBranchData();
}

class EventsBranchData extends StatefulShellBranchData {
  const EventsBranchData();
}

//leaf

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

class GroupsRoute extends GoRouteData with $GroupsRoute {
  const GroupsRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const GroupsPage();
}

class EventsRoute extends GoRouteData with $EventsRoute {
  const EventsRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const EventsPage();
}

// --- 2. STANDALONE ROUTES ---
@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginPage();
}

@TypedGoRoute<RegisterRoute>(path: '/register')
class RegisterRoute extends GoRouteData with $RegisterRoute {
  const RegisterRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Placeholder();
}

//TODO build authentication feature first
