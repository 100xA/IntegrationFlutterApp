import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_flutter_app/components/dashboard/bloc/item_list_cubit.dart';
import 'package:integration_flutter_app/components/profile/bloc/profile_cubit.dart';
import 'package:integration_flutter_app/core/services/service_locator.dart';

class GlobalBlocProvider extends StatelessWidget {
  final Widget child;

  const GlobalBlocProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ItemListCubit>.value(
            value: app.get<ItemListCubit>()..initialize()),
        BlocProvider<ProfileCubit>.value(
            value: app.get<ProfileCubit>()..initialize())
      ],
      child: child,
    );
  }
}
