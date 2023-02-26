import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_flutter_app/components/profile/bloc/profile_cubit.dart';
import 'package:integration_flutter_app/components/profile/bloc/profile_state.dart';
import 'package:integration_flutter_app/misc/design/colors.dart';
import 'package:integration_flutter_app/misc/widgets/integration_app_bar.dart';

import '../../../core/services/service_locator.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  ProfileCubit profileCubit = app.get<ProfileCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (_, state) => Scaffold(
        appBar: const IntegrationAppBar(
          title: Text("Profil"),
          showBackButton: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            // TODO: Profile Picture
            const SizedBox(
              height: 300,
            ),
            Container(
              height: 600,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: purpleColor),
              width: double.infinity,
              child: Column(children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Text(
                  state.profile?.name ?? "Kein name gefunden",
                  style: const TextStyle(fontSize: 20),
                ),
                //Image(image: AssetImage("assets/img/lana.jpg")),
                Text(
                  profileCubit.jobTypeFilter(state.profile?.job),
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),

                Container(
                  height: 512,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white),
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Persönliche Informationen",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text("Name: ${state.profile?.name}"),
                      const SizedBox(height: 20),
                      Text("Geburtsland: ${state.profile?.origin}"),
                      const SizedBox(height: 20),
                      Text(
                          "Berechtigungsrolle: ${profileCubit.roleTypeFilter(state.profile?.role)}")
                    ],
                  ),
                ),
              ]),
            ),
          ],
        )),
      ),
    );
  }
}
