import 'package:flutter/material.dart';
import 'package:integration_flutter_app/design/colors.dart';

import 'components/dashboard/ui/integration_dashboard.dart';

class IntegrationApp extends StatelessWidget {
  const IntegrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: purpleColor,
      ),
      home: IntegrationDashboard(title: 'Dashboard'),
    );
  }
}
