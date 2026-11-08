import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wayve/core/di/injection.dart';
import 'package:wayve/core/router/app_router.dart';
import 'package:wayve/core/theme/app_theme.dart';
import 'package:wayve/core/theme/cubit/theme_cubit.dart';
import 'package:wayve/features/authentication/presentation/bloc/auth_bloc.dart';

class WayveApp extends StatelessWidget {
  const WayveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<AuthBloc>()),
        BlocProvider.value(value: getIt<ThemeCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            routerConfig: getIt<AppRouter>().goRouter,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
          );
        },
      ),
    );
  }
}
