import 'dart:convert';

import 'package:equatable/equatable.dart';

class ItemMachine extends Equatable {
  /// The unique ID given by [Firebase]
  final String? id;

  /// Name of the machine
  final String? name;

  /// unique serial number given to each machine
  final int? serialNumber;

  /// String (maybe later a List) of current problems facing the machine
  final String? currentProblems;

  /// Identifier of the machine, stored as a int for querying in [Firebase]
  final int? machine;

  static const int machineUndefined = 99;
  static const int machinePrinter = 0;
  static const int machineSorter = 1;

  /// List of machine types for querying in [Firebase]
  static const List<int> machineType = [
    ItemMachine.machineUndefined,
    ItemMachine.machinePrinter,
    ItemMachine.machineSorter,
  ];

  const ItemMachine({
    this.id,
    required this.name,
    required this.serialNumber,
    required this.currentProblems,
    required this.machine,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "serialNumber": serialNumber,
      "currentProblems": currentProblems,
      "machine": machine,
    };
  }

  factory ItemMachine.fromJson(Map<String, dynamic> map) => ItemMachine(
      name: map["name"] as String?,
      serialNumber: map["serialNumber"] as int?,
      currentProblems: map["currentProblems"] as String?,
      machine: map["machine"] as int? ?? ItemMachine.machineUndefined);

  factory ItemMachine.fromMap(Map<String, dynamic> map) {
    return ItemMachine(
      name: map["name"] as String,
      serialNumber: map["serialNumber"] as int,
      currentProblems: map["currentProblems"] as String,
      machine: map["machine"] as int,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  ItemMachine copyWith({
    String? id,
    String? name,
    int? serialNumber,
    String? currentProblems,
    int? machine,
  }) =>
      ItemMachine(
          id: id ?? this.id,
          name: name ?? this.name,
          serialNumber: serialNumber ?? this.serialNumber,
          currentProblems: currentProblems ?? this.currentProblems,
          machine: machine ?? this.machine);

  @override
  List<Object?> get props => [
        id,
        name,
        serialNumber,
        currentProblems,
        machine,
      ];
}
