import 'package:flutter/material.dart';

class MeasureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messen'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              const Text(
                "Elektrische Ausrüstung",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/img/inspection/inspection_measure_1.jpeg',
                width: 200,
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Die Wartung der elektrischen Ausrüstung hat höchste Priorität, um die Lebensdauer der Abkantpresse zu verlängern. Überprüfen Sie mindestens einmal im Jahr die gesamte elektrische Anlage, einschließlich aller elektrischen Anschlüsse und Schalter. Vor der Inspektion muss der Hauptstromschalter ausgeschaltet werden. Andere Inspektionen können nach dem Einschalten der Stromversorgung durchgeführt werden. Halten Sie die Bauteile in einem sauberen und sicheren Zustand, wenn Sie die elektrischen Komponenten zusammenbauen. Überprüfen Sie den Anschlussstatus der Klemmenkästen und Klemmleisten am Monitor und am Relais. Prüfen Sie, ob alle Drähte lose sind, ob die Isolierung beschädigt ist und ob die Drähte sauber und ordentlich sind. Wenn die Drähte lose sind, ziehen Sie sie fest und reinigen Sie sie mit einem sauberen Tuch oder mit Druckluft. sPrüfen Sie den Luftfilter des Schaltschranks und des Wechselrichterkastens und reinigen Sie ihn mit Druckluft.Überprüfen Sie alle Kabel, Leiterplatten und Schalter. Wenn sie beschädigt oder defekt sind, reparieren oder ersetzen Sie sie. Prüfen Sie, ob die Endschalter und die Spannung in gutem Zustand sind. Halten Sie das Kühlgebläse und den Wärmetauscherfilter sauber und in Betrieb.Prüfen Sie, ob das externe Bedienfeld des Schaltkastens ausgeschaltet ist und ob die Schalter, die Beleuchtung und andere Funktionen normal funktionieren.',
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
