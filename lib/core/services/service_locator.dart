import 'package:get_it/get_it.dart';
import 'package:integration_flutter_app/components/dashboard/bloc/item_list_cubit.dart';
import 'package:integration_flutter_app/components/profile/bloc/profile_cubit.dart';

final GetIt app = GetIt.instance;

void setupServices() {
  app
    ..registerLazySingleton<ItemListCubit>(() => ItemListCubit())
    ..registerLazySingleton<ProfileCubit>(() => ProfileCubit());
}
