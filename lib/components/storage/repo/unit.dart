import 'package:equatable/equatable.dart';

class TileModel extends Equatable {
  final String description;
  final int number;
  final String imagePath;

  const TileModel(
      {required this.description,
      required this.number,
      required this.imagePath});

  @override
  List<Object?> get props => [description, number, imagePath];
}
