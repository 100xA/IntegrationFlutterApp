import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/unit.dart';

final List<TileModel> _initialList = [
  const TileModel(
      description: 'Schraube M8x35mm ',
      number: 31412,
      imagePath: "assets/img/storage/storage_image_1.jpeg"),
  const TileModel(
      description: 'Unterlegscheiben DIN 125 Standard',
      number: 23232,
      imagePath: "assets/img/storage/storage_image_2.jpeg"),
  const TileModel(
      description: 'Unterlegscheiben DIN 440 Standard',
      number: 33213,
      imagePath: "assets/img/storage/storage_image_3.jpeg"),
  const TileModel(
      description: 'Zahnrad',
      number: 45343,
      imagePath: "assets/img/storage/storage_image_4.jpeg"),
  const TileModel(
      description: 'Sme-Schrauben-Element',
      number: 86096,
      imagePath: "assets/img/storage/storage_image_5.jpeg"),
  const TileModel(
      description: 'Befestigungsschiene',
      number: 96946,
      imagePath: "assets/img/storage/storage_image_6.jpeg"),
  const TileModel(
      description: 'Kupplung, 16-32 mm',
      number: 89471,
      imagePath: "assets/img/storage/storage_image_7.jpeg"),
  const TileModel(
      description: 'M8 Hülsen Spreizfunktion',
      number: 73428,
      imagePath: "assets/img/storage/storage_image_8.jpeg"),
  const TileModel(
      description: 'Metallplatte mit Löchern 148x105mm',
      number: 93812,
      imagePath: "assets/img/storage/storage_image_9.jpeg"),
  const TileModel(
      description: 'Metallverbundrohr PE-RT 16x2.0 5m_Stange',
      number: 98316,
      imagePath: "assets/img/storage/storage_image_10.jpeg"),
  const TileModel(
      description: 'Press-Übergangsnippel',
      number: 97457,
      imagePath: "assets/img/storage/storage_image_11.jpeg"),
  const TileModel(
      description: 'RAVENOL Super HD 30 Öl',
      number: 83284,
      imagePath: "assets/img/storage/storage_image_12.jpeg"),
];

final List<TileModel> _idList = [
  const TileModel(
      description: 'Kupplung, 16-32 mm',
      number: 89471,
      imagePath: "assets/img/storage/storage_image_7.jpeg"),
  const TileModel(
      description: 'M8 Hülsen Spreizfunktion',
      number: 73428,
      imagePath: "assets/img/storage/storage_image_8.jpeg"),
  const TileModel(
      description: 'Metallplatte mit Löchern 148x105mm',
      number: 93812,
      imagePath: "assets/img/storage/storage_image_9.jpeg"),
  const TileModel(
      description: 'Metallverbundrohr PE-RT 16x2.0 5m_Stange',
      number: 98316,
      imagePath: "assets/img/storage/storage_image_10.jpeg"),
  const TileModel(
      description: 'Press-Übergangsnippel',
      number: 97457,
      imagePath: "assets/img/storage/storage_image_11.jpeg"),
  const TileModel(
      description: 'RAVENOL Super HD 30 Öl',
      number: 83284,
      imagePath: "assets/img/storage/storage_image_12.jpeg"),
];

class TileListCubit extends Cubit<List<TileModel>> {
  TileListCubit() : super(_idList);

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

  void searchIdTiles(String query) {
    if (query.isEmpty) {
      emit(_idList);
    } else {
      final filteredList = _idList
          .where((tile) =>
              tile.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(filteredList);
    }
  }
}
