import 'package:flutter/material.dart';

class AdjustScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nachstellen'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              const SizedBox(height: 20),
              Image.asset(
                'assets/img/inspection/inspection_adjust_1.jpeg',
                width: 200,
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Eine Abkantpresse ist eine Maschine, die zum Biegen verschiedener Bleche verwendet wird. Der Stempel und die Matrize der Maschine kommen direkt mit dem Blech in Berührung, daher ist das Material der Matrize besonders wichtig. Auch das Material des Werkstücks muss berücksichtigt werden, denn das Material mit den Walzspänen verschleißt die Matrize. Nach dem Gebrauch müssen Stempel und Matrize regelmäßig gewartet werden, um Rost und Korrosion zu vermeiden. Wischen Sie die Stempel und Matrizen nach jedem Gebrauch mit einem sauberen, fusselfreien Handtuch und Alkohol ab. Dies geschieht, um Fingerabdrücke zu vermeiden, da der pH-Wert der Hände die Oberfläche der Matrize angreift. Tragen Sie dann Handschuhe, um Korrosionsschutzmittel auf die Stempel und Matrizen aufzutragen. Legen Sie sie schließlich in den Werkzeugkasten und legen Sie mindestens einen Beutel Silikagel hinein. Wenn der Stempel oder die Matrize beschädigt ist, muss er/sie ersetzt werden.",
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
