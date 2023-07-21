import 'package:get_it/get_it.dart';
import 'package:integration_flutter_app/components/dashboard/bloc/item_list_cubit.dart';
import 'package:integration_flutter_app/components/profile/bloc/profile_cubit.dart';
import 'package:integration_flutter_app/components/storage/bloc/unit_list_cubit.dart';

final GetIt app = GetIt.instance;

/// register all necessary [Services] with [Get-it]
void setupServices() {
  app
    ..registerLazySingleton<ItemListCubit>(() => ItemListCubit())
    ..registerLazySingleton<ProfileCubit>(() => ProfileCubit())
    ..registerLazySingleton<TileListCubit>(() => TileListCubit());
}
