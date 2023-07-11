import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_flutter_app/components/profile/bloc/profile_cubit.dart';
import 'package:integration_flutter_app/components/profile/bloc/profile_state.dart';
import 'package:integration_flutter_app/misc/design/colors.dart';
import 'package:integration_flutter_app/misc/widgets/integration_app_bar.dart';
import 'package:integration_flutter_app/misc/widgets/integration_custom_avatar.dart';

import '../../../core/services/service_locator.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileCubit profileCubit = app.get<ProfileCubit>();

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
            const SizedBox(
              height: 20,
            ),
            const IntegrationCustomAvatar(
                radius: 100,
                url:
                    "https://media.licdn.com/dms/image/D4E03AQHgf5CKvuUH8w/profile-displayphoto-shrink_800_800/0/1687419413255?e=1694649600&v=beta&t=GREcvaPziLp_0RiDq3ZCteIGzO5dBqCyHJ4whJxydno"),
            const SizedBox(
              height: 20,
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
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  profileCubit.jobTypeFilter(state.profile?.job),
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
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
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Geburtsland: ${state.profile?.origin}",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Geburtstag: 01.04.2020",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Geburtsort: Berlin",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Berechtigungsrolle: ${profileCubit.roleTypeFilter(state.profile?.role)}",
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                      ],
                    ),
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
