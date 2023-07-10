import 'package:flutter/material.dart';

class CheckScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prüfen'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              const Text(
                "Mechanische Komponenten",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/img/inspection/inspection_check_1.jpeg',
                width: 200,
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Eine regelmäßige Überprüfung der mechanischen Komponenten ist notwendig, um die Stabilität aller Teile zu gewährleisten. Es ist wichtig, dass alle Bolzen, Muttern und Schrauben regelmäßig nachgezogen werden und die Verbindung zwischen Kolben und Stößel überprüft wird. Untersuchen Sie das Verbindungsteil der Basis auf Risse und prüfen Sie den Zustand des Hinteranschlags und des Anschlagfingers. Falls erforderlich, ist eine Neukalibrierung erforderlich.',
                  textAlign: TextAlign.left,
                ),
              ),
              const Text(
                "Schmierungssystem",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/img/inspection/inspection_check_2.jpeg',
                width: 200,
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Die Schmierung der Abkantteile ist ein wichtiger Faktor für die Verlängerung der Lebensdauer der Maschine. Einige Teile der Abkantpresse sind Gleit-, Roll- oder Reibungsvorgängen ausgesetzt.Die Schmierung kann die Reibung und die Beschädigung von Bauteilen verringern. Zu den Teilen, die regelmäßig geschmiert und gereinigt werden müssen, gehören die Kugelumlaufspindel, die Führungsschiene, der Hinteranschlag, das Getriebe usw. Diese sollten mindestens einmal pro Woche geschmiert werden, manche Teile müssen sogar täglich geschmiert werden. Es ist jedoch wichtig, nicht zu viel zu schmieren, da dies zu unzureichender Reibung oder zur Verschmutzung der Komponenten führen kann. Bevor Sie Schmiermittel oder Fett auftragen, müssen Sie alle Komponenten reinigen und die vom Hersteller empfohlenen Schmiermittel verwenden.',
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
