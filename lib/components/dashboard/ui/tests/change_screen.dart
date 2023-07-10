import 'package:flutter/material.dart';

class ChangeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Austauschen'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              const Text(
                "Arten von Stempeln und Matrizen",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/img/inspection/inspection_change_1.jpeg',
                width: 200,
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Zu den Abkantwerkzeugen gehören V-Werkzeuge, U-Werkzeuge und Z-Werkzeuge, wobei die V-Werkzeuge am häufigsten verwendet werden. Die Mindestflanschlänge sollte mindestens das 4-fache der Materialdicke betragen, da sonst der genaue Biegewinkel nicht erreicht werden kann. V-Matrizensätze mit unterschiedlichen Öffnungsweiten passen zu den entsprechenden Stempeln, so dass die Abkantpresse in verschiedenen Winkeln und Materialien biegen kann. Auf diese Weise wird die Abkantpresse kann in verschiedenen Winkeln und mit verschiedenen Materialien gebogen werden. Abkantstempel werden hauptsächlich in drei Typen eingeteilt: gerade Stempel, Schwanenhalsstempel und Spitzstempel.",
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
