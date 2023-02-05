import 'package:flutter/material.dart';
import 'package:integration_flutter_app/misc/design/colors.dart';

import 'components/dashboard/ui/integration_dashboard.dart';

class IntegrationApp extends StatelessWidget {
  const IntegrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      // Access global theme
      theme: ThemeData(
        primarySwatch: purpleColor,
      ),
      home: const IntegrationDashboard(),
    );
  }
}
