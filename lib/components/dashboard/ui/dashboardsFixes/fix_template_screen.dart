import 'package:flutter/material.dart';
import 'package:integration_flutter_app/misc/constants.dart';
import 'package:integration_flutter_app/misc/widgets/integration_app_bar.dart';

/// Template UI for all [fixedDescriptionModel] in [constants.dart]

class FixTemplateScreen extends StatelessWidget {
  final FixedDescription fixedDescription;
  const FixTemplateScreen({super.key, required this.fixedDescription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IntegrationAppBar(
        title: Text(fixedDescription.title),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              const SizedBox(height: 20),
              Image.asset(
                fixedDescription.imagePath,
                width: 200,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  fixedDescription.description,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
