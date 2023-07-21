import 'package:equatable/equatable.dart';
import 'package:table_calendar/table_calendar.dart';

class TaskState extends Equatable {
  final CalendarFormat? calendarFormat;
  final DateTime? focusedDay;
  final DateTime? selectedDay;
  final Map<DateTime, List<dynamic>>? events;

  const TaskState({
    this.calendarFormat = CalendarFormat.month,
    this.focusedDay,
    this.selectedDay,
    this.events = const {},
  });

  TaskState copyWith({
    CalendarFormat? calendarFormat,
    DateTime? focusedDay,
    DateTime? selectedDay,
    Map<DateTime, List<dynamic>>? events,
  }) {
    return TaskState(
      calendarFormat: calendarFormat ?? this.calendarFormat,
      focusedDay: focusedDay ?? this.focusedDay,
      selectedDay: selectedDay ?? this.selectedDay,
      events: events ?? this.events,
    );
  }

  @override
  List<Object?> get props => [calendarFormat, focusedDay, selectedDay, events];
}
