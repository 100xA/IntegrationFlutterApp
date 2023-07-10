import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/unit.dart';

class TileListCubit extends Cubit<List<TileModel>> {
  TileListCubit() : super(_initialList);

  static final List<TileModel> _initialList = [
    TileModel(
        description: 'Schraube M8x35mm ',
        number: 31412,
        imagePath: "assets/img/storage/storage_image_1.jpeg"),
    TileModel(
        description: 'Unterlegscheiben DIN 125 Standard',
        number: 23232,
        imagePath: "assets/img/storage/storage_image_2.jpeg"),
    TileModel(
        description: 'Unterlegscheiben DIN 440 Standard',
        number: 33213,
        imagePath: "assets/img/storage/storage_image_3.jpeg"),
    TileModel(
        description: 'Zahnrad',
        number: 45343,
        imagePath: "assets/img/storage/storage_image_4.jpeg"),
    TileModel(
        description: 'Sme-Schrauben-Element',
        number: 86096,
        imagePath: "assets/img/storage/storage_image_5.jpeg"),
    TileModel(
        description: 'Befestigungsschiene',
        number: 96946,
        imagePath: "assets/img/storage/storage_image_6.jpeg"),
    TileModel(
        description: 'Kupplung, 16-32 mm',
        number: 89471,
        imagePath: "assets/img/storage/storage_image_7.jpeg"),
    TileModel(
        description: 'M8 Hülsen Spreizfunktion',
        number: 73428,
        imagePath: "assets/img/storage/storage_image_8.jpeg"),
    TileModel(
        description: 'Metallplatte mit Löchern 148x105mm',
        number: 93812,
        imagePath: "assets/img/storage/storage_image_9.jpeg"),
    TileModel(
        description: 'Metallverbundrohr PE-RT 16x2.0 5m_Stange',
        number: 98316,
        imagePath: "assets/img/storage/storage_image_10.jpeg"),
    TileModel(
        description: 'Press-Übergangsnippel',
        number: 97457,
        imagePath: "assets/img/storage/storage_image_11.jpeg"),
    TileModel(
        description: 'RAVENOL Super HD 30 Öl',
        number: 83284,
        imagePath: "assets/img/storage/storage_image_12.jpeg"),
  ];

  void searchTiles(String query) {
    if (query.isEmpty) {
      emit(_initialList);
    } else {
      final filteredList = _initialList
          .where((tile) =>
              tile.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(filteredList);
    }
  }
}
