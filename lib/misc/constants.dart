import 'package:equatable/equatable.dart';

class FixedDescription extends Equatable {
  final String imagePath, title, description;

  const FixedDescription(
      {required this.imagePath,
      required this.title,
      required this.description});

  @override
  List<Object?> get props => [imagePath, title, description];
}

/// [FixedDescriptionsModelList] for [FixTemplateScreen]

List<FixedDescription> fixedDescriptionsList = [
  const FixedDescription(
      imagePath: "assets/img/inspection/inspection_adjust_1.jpeg",
      title: "Nachstellen",
      description:
          "Eine Abkantpresse ist eine Maschine, die zum Biegen verschiedener Bleche verwendet wird. Der Stempel und die Matrize der Maschine kommen direkt mit dem Blech in Berührung, daher ist das Material der Matrize besonders wichtig. Auch das Material des Werkstücks muss berücksichtigt werden, denn das Material mit den Walzspänen verschleißt die Matrize. Nach dem Gebrauch müssen Stempel und Matrize regelmäßig gewartet werden, um Rost und Korrosion zu vermeiden. Wischen Sie die Stempel und Matrizen nach jedem Gebrauch mit einem sauberen, fusselfreien Handtuch und Alkohol ab. Dies geschieht, um Fingerabdrücke zu vermeiden, da der pH-Wert der Hände die Oberfläche der Matrize angreift. Tragen Sie dann Handschuhe, um Korrosionsschutzmittel auf die Stempel und Matrizen aufzutragen. Legen Sie sie schließlich in den Werkzeugkasten und legen Sie mindestens einen Beutel Silikagel hinein. Wenn der Stempel oder die Matrize beschädigt ist, muss er/sie ersetzt werden. "),
  const FixedDescription(
      imagePath: "assets/img/inspection/inspection_fill_1.jpeg",
      title: "Nachfüllen",
      description:
          "Verwenden Sie die von den Herstellern empfohlene Ölsorte, um die Sauberkeit des Öls zu gewährleisten. Kontrollieren Sie täglich den Ölstand im Öltank und verwenden Sie eine elektrische Pumpe zum Auffüllen des Öls. Die Qualität und Viskosität des Öls sollte alle 4000 bis 6000 Betriebsstunden überprüft werden."),
  const FixedDescription(
      imagePath: "assets/img/inspection/inspection_lubricate_1.jpeg",
      title: "Schmieren",
      description:
          "Prüfen Sie alle Leitungen und Schläuche auf Dichtheit, insbesondere die Hydraulikpumpe und das Anschlusszubehör. Bei Ausdehnung der Ölschläuche, Alterung oder Verschleiß der Rohrleitungen sollten diese umgehend ausgetauscht werden. Prüfen Sie die Zylinderbaugruppe, die Ventile und den Hydraulikblock auf Undichtigkeiten. Wenn sich zu viel Öl auf dem Kolben befindet, wischen Sie ihn ab und schmieren Sie ihn richtig. Überprüfen Sie den maximalen Druck der Pumpe und des Überdruckventils."),
  const FixedDescription(
      imagePath: "assets/img/inspection/inspection_clean_1.jpeg",
      title: "Reinigen",
      description:
          "Für die Reinigung kann Druckluft mit einem maximalen Druck von 3 Bar verwendet werden; die Schutzbrille ist nötig. Benutze keine Putzmittel oder chemische Substanzen, die die Kabel beschädigen können. Reinigung der Filter des Schaltschranks und des Wechselrichters. Zerlege und putze die Luftfilter des Schaltschranks und des Wechselrichters."),
  const FixedDescription(
    imagePath: "assets/img/inspection/inspection_check_1.jpeg",
    title: "Prüfen",
    description:
        "Eine regelmäßige Überprüfung der mechanischen Komponenten ist notwendig, um die Stabilität aller Teile zu gewährleisten. Es ist wichtig, dass alle Bolzen, Muttern und Schrauben regelmäßig nachgezogen werden und die Verbindung zwischen Kolben und Stößel überprüft wird. Untersuchen Sie das Verbindungsteil der Basis auf Risse und prüfen Sie den Zustand des Hinteranschlags und des Anschlagfingers. Falls erforderlich, ist eine Neukalibrierung erforderlich.",
  ),
  const FixedDescription(
      imagePath: "assets/img/inspection/inspection_measure_1.jpeg",
      title: "Messen",
      description:
          "Die Wartung der elektrischen Ausrüstung hat höchste Priorität, um die Lebensdauer der Abkantpresse zu verlängern. Überprüfen Sie mindestens einmal im Jahr die gesamte elektrische Anlage, einschließlich aller elektrischen Anschlüsse und Schalter. Vor der Inspektion muss der Hauptstromschalter ausgeschaltet werden. Andere Inspektionen können nach dem Einschalten der Stromversorgung durchgeführt werden. Halten Sie die Bauteile in einem sauberen und sicheren Zustand, wenn Sie die elektrischen Komponenten zusammenbauen. Überprüfen Sie den Anschlussstatus der Klemmenkästen und Klemmleisten am Monitor und am Relais. Prüfen Sie, ob alle Drähte lose sind, ob die Isolierung beschädigt ist und ob die Drähte sauber und ordentlich sind. Wenn die Drähte lose sind, ziehen Sie sie fest und reinigen Sie sie mit einem sauberen Tuch oder mit Druckluft. sPrüfen Sie den Luftfilter des Schaltschranks und des Wechselrichterkastens und reinigen Sie ihn mit Druckluft.Überprüfen Sie alle Kabel, Leiterplatten und Schalter. Wenn sie beschädigt oder defekt sind, reparieren oder ersetzen Sie sie. Prüfen Sie, ob die Endschalter und die Spannung in gutem Zustand sind. Halten Sie das Kühlgebläse und den Wärmetauscherfilter sauber und in Betrieb.Prüfen Sie, ob das externe Bedienfeld des Schaltkastens ausgeschaltet ist und ob die Schalter, die Beleuchtung und andere Funktionen normal funktionieren.")
];
