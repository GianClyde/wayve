import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wayve/core/secrets/app_secrets.dart';

@module
abstract class CoreModule {
  @preResolve
  Future<Supabase> get initSupabase => Supabase.initialize(
    url: AppSecrets().supabaseUrl,
    publishableKey: AppSecrets().supabasepublishableKey,
  );
  @preResolve
  Future<HydratedStorage> get hydratedStorage async {
    final storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorageDirectory.web
          : HydratedStorageDirectory(
              (await getApplicationDocumentsDirectory()).path,
            ),
    );
    HydratedBloc.storage = storage;
    return storage;
  }

  @lazySingleton
  SupabaseClient get supabase => Supabase.instance.client;
}
