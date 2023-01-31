import 'package:equatable/equatable.dart';

class ItemMachine extends Equatable {
  final String? name;
  final int? serialNumber;
  final String? currentProblems;
  final int? machine;

  static const int machineUndefined = 99;
  static const int machinePrinter = 0;
  static const int machineSorter = 1;

  static const List<int> machineType = [
    ItemMachine.machineUndefined,
    ItemMachine.machinePrinter,
    ItemMachine.machineSorter,
  ];

  static String machineTypeFilter(int id) {
    switch (id) {
      case 0:
        return "Printer";
      case 1:
        return "Sorter Machine";
      case 99:
      default:
        return "Unknown";
    }
  }

  const ItemMachine({
    required this.name,
    required this.serialNumber,
    required this.currentProblems,
    required this.machine,
  });

  factory ItemMachine.fromJson(Map<String, dynamic> map) => ItemMachine(
      name: map["name"] as String?,
      serialNumber: map["serialNumber"] as int?,
      currentProblems: map["currentProblems"] as String?,
      machine: map["machine"] as int? ?? ItemMachine.machineUndefined);

  Map<String, dynamic> toJson() => {
        "name": name,
        "serialNumber": serialNumber,
        "currentProblems": currentProblems,
        "machine": machine,
      };

  ItemMachine copyWith({
    String? name,
    int? serialNumber,
    String? currentProblems,
    int? machine,
  }) =>
      ItemMachine(
          name: name ?? this.name,
          serialNumber: serialNumber ?? this.serialNumber,
          currentProblems: currentProblems ?? this.currentProblems,
          machine: machine ?? this.machine);

  @override
  List<Object?> get props => [name, serialNumber, currentProblems, machine];
}
