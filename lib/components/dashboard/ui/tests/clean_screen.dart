import 'package:flutter/material.dart';

class CleanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reinigen'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              const SizedBox(height: 20),
              Image.asset(
                'assets/img/inspection/inspection_clean_1.jpeg',
                width: 200,
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Für die Reinigung kann Druckluft mit einem maximalen Druck von 3 Bar verwendet werden; die Schutzbrille ist nötig. Benutze keine Putzmittel oder chemische Substanzen, die die Kabel beschädigen können. Reinigung der Filter des Schaltschranks und des Wechselrichters. Zerlege und putze die Luftfilter des Schaltschranks und des Wechselrichters.",
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
