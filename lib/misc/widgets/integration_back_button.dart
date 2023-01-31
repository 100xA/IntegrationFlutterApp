import 'package:flutter/material.dart';

class IntegrationBackButton extends StatelessWidget {
  final VoidCallback? onBackAction;
  const IntegrationBackButton({Key? key, this.onBackAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onBackAction?.call();
        Navigator.of(context).maybePop();
      },
      child: const Icon(Icons.chevron_left_rounded, color: Colors.black),
    );
  }
}
