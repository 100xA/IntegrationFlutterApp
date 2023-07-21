import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../misc/widgets/integration_dashboard_drawer.dart';
import '../bloc/task_cubit.dart';
import '../bloc/task_state.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalendar'),
      ),
      drawer: const IntegrationDashboardDrawer(),
      body: Column(
        children: [
          BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              return TableCalendar(
                focusedDay: state.focusedDay!,
                firstDay: DateTime.utc(2021),
                lastDay: DateTime.utc(2030),
                selectedDayPredicate: (day) {
                  return isSameDay(state.selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  context
                      .read<TaskCubit>()
                      .updateSelectedDay(selectedDay, focusedDay);
                },
                eventLoader: (day) {
                  return state.events?[day] ?? [];
                },
              );
            },
          ),
          const SizedBox(height: 16),
          const Text(
            "Aufgaben",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.events?[state.selectedDay]?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        "- ${state.events![state.selectedDay]![index]}",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<TaskCubit>().showAddTaskDialog(context);
        },
      ),
    );
  }
}
