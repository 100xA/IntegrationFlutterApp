import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:integration_flutter_app/integration_app.dart';
import 'core/widgets/global_bloc_provider.dart';
import 'package:integration_flutter_app/core/services/service_locator.dart';

import 'dart:developer' as developer;

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      /// Set Rotation only to [PotraitMode]
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      /// Setup [GlobalServiceLocator] for [Cubits] with [Get-it]
      setupServices();

      /// initialize [Firebase]
      await Firebase.initializeApp();
      FirebaseDatabase.instance.setPersistenceEnabled(true);
      FirebaseFirestore.instance.settings =
          const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);

      runApp(
        /// initialize all [Blocs] necessary for App-Startup
        const GlobalBlocProvider(
          child: IntegrationApp(),
        ),
      );
    },
    (e, stack) => developer.log(stack.toString()),
  );
}
