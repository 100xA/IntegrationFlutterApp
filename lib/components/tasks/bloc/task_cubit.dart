import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_flutter_app/components/tasks/bloc/task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  DateTime _selectedDay = DateTime.now();
  final Map<DateTime, List<dynamic>> _events = {};

  TaskCubit() : super(TaskState(focusedDay: DateTime.now()));

  /// Initialize the state, with necessary parameters focusedDay and selectedDay
  Future<void> initialize() async {
    emit(state.copyWith(
        focusedDay: DateTime.now(), selectedDay: DateTime.now()));
  }

  void updateSelectedDay(DateTime selectedDay, DateTime focusedDay) {
    _selectedDay = selectedDay;
    emit(state.copyWith(selectedDay: selectedDay, focusedDay: focusedDay));
  }

  /// Add Task to the List events
  void addTask(String taskName) {
    if (_events[_selectedDay] == null) {
      _events[_selectedDay] = [];
    }
    _events[_selectedDay]?.add(taskName);
    emit(state.copyWith(events: _events));
  }

  /// Show Dialog with Options Cancel and Add Tasks to List events
  void showAddTaskDialog(BuildContext context) {
    String taskName = "";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Task"),
          content: TextField(
            onChanged: (value) {
              taskName = value;
            },
            decoration: const InputDecoration(hintText: "Auftragsname"),
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Auftrag hinzufügen"),
              onPressed: () {
                addTask(taskName);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
