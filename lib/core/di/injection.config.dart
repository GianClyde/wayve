// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:hydrated_bloc/hydrated_bloc.dart' as _i67;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;
import 'package:wayve/core/di/core_module.dart' as _i784;
import 'package:wayve/core/router/app_router.dart' as _i109;
import 'package:wayve/core/theme/cubit/theme_cubit.dart' as _i580;
import 'package:wayve/features/authentication/data/datasource/remote/remote_datasource.dart'
    as _i102;
import 'package:wayve/features/authentication/data/repository/auth_repository_impl.dart'
    as _i846;
import 'package:wayve/features/authentication/domain/repository/auth_repository.dart'
    as _i490;
import 'package:wayve/features/authentication/domain/usecase/email_login.dart'
    as _i893;
import 'package:wayve/features/authentication/domain/usecase/watch_auth_stream.dart'
    as _i210;
import 'package:wayve/features/authentication/presentation/bloc/auth_bloc.dart'
    as _i221;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final coreModule = _$CoreModule();
    await gh.factoryAsync<_i454.Supabase>(
      () => coreModule.initSupabase,
      preResolve: true,
    );
    await gh.factoryAsync<_i67.HydratedStorage>(
      () => coreModule.hydratedStorage,
      preResolve: true,
    );
    gh.lazySingleton<_i454.SupabaseClient>(() => coreModule.supabase);
    gh.lazySingleton<_i580.ThemeCubit>(() => _i580.ThemeCubit());
    gh.lazySingleton<_i102.RemoteDatasource>(
      () => _i102.RemoteDatasource(supabaseClient: gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i490.AuthRepository>(
      () => _i846.AuthRepositoryImpl(
        remoteDatasource: gh<_i102.RemoteDatasource>(),
      ),
    );
    gh.lazySingleton<_i210.WatchAuthStateUsecase>(
      () => _i210.WatchAuthStateUsecase(gh<_i490.AuthRepository>()),
    );
    gh.factory<_i893.EmailLoginUsecase>(
      () => _i893.EmailLoginUsecase(authRepository: gh<_i490.AuthRepository>()),
    );
    gh.lazySingleton<_i221.AuthBloc>(
      () => _i221.AuthBloc(
        emailLoginUsecase: gh<_i893.EmailLoginUsecase>(),
        watchAuthStateUsecase: gh<_i210.WatchAuthStateUsecase>(),
      ),
    );
    gh.singleton<_i109.AppRouter>(
      () => _i109.AppRouter(authBloc: gh<_i221.AuthBloc>()),
    );
    return this;
  }
}

class _$CoreModule extends _i784.CoreModule {}
