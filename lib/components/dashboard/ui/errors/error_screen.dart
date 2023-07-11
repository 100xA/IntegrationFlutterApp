import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fehler 1'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              const SizedBox(height: 20),
              Image.asset(
                'assets/img/error/error_1.jpeg',
                width: 200,
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Fehlfunktion beim Einspannen–Mikroschalter überprüfen\n\n"
                  "1. Der Mikroschalter befindet sich im Schaltschrank auf einer verstellbaren Gleithalterung. Der Aktor ist auf einem Messingbügel auf der Biegewinkelanzeige befestigt.\n\n"
                  "2. Beim Anheben der Biegewange dreht sich der Messingbügel, wodurch der Aktor den Armdes Mikroschalters nach unten drückt. Sie sollten beim Ein-und Ausschalten des Mikroschalters ein klickendes Geräusch hören\n\n"
                  "3. Falls dies nicht der Fall ist, stellen Sie die Schraube des Aktors nach\n\n"
                  "4. Falls der Schalter nach wie vor nicht mit einem klickenden Geräusch ein-und ausschaltet, richten Sie den Mikroschalter neu aus.\n\n"
                  "5. Möglicherweise ist die Sicherung des Mikroschalters durchgebrannt. In diesem Fall muss der Mikroschalter ausgewechselt werden.\n\n",
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
