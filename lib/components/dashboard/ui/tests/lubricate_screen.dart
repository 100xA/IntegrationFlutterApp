import 'package:flutter/material.dart';

class LubricateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schmieren'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              const Text(
                "Hydraulische Armaturen",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/img/inspection/inspection_lubricate_1.jpeg',
                width: 200,
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Prüfen Sie alle Leitungen und Schläuche auf Dichtheit, insbesondere die Hydraulikpumpe und das Anschlusszubehör. Bei Ausdehnung der Ölschläuche, Alterung oder Verschleiß der Rohrleitungen sollten diese umgehend ausgetauscht werden. Prüfen Sie die Zylinderbaugruppe, die Ventile und den Hydraulikblock auf Undichtigkeiten. Wenn sich zu viel Öl auf dem Kolben befindet, wischen Sie ihn ab und schmieren Sie ihn richtig. Überprüfen Sie den maximalen Druck der Pumpe und des Überdruckventils.",
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
