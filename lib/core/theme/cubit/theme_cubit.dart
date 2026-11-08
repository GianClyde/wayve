// core/theme/cubit/theme_cubit.dart
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode mode) {
    if (state != mode) {
      emit(mode);
    }
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    try {
      final index = json['theme_mode'] as int;
      return ThemeMode.values[index];
    } catch (_) {
      return ThemeMode.system;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {'theme_mode': state.index};
  }
}
