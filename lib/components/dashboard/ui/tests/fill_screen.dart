import 'package:flutter/material.dart';

class FillScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nachfüllen'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              const Text(
                "Die Sauberkeit und der Füllstand des Öls",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/img/inspection/inspection_fill_1.jpeg',
                width: 200,
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Verwenden Sie die von den Herstellern empfohlene Ölsorte, um die Sauberkeit des Öls zu gewährleisten. Kontrollieren Sie täglich den Ölstand im Öltank und verwenden Sie eine elektrische Pumpe zum Auffüllen des Öls. Die Qualität und Viskosität des Öls sollte alle 4000 bis 6000 Betriebsstunden überprüft werden.",
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
