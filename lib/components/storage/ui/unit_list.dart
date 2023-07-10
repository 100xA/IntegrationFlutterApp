import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_flutter_app/misc/widgets/integration_dashboard_drawer.dart';

import '../bloc/unit_list_cubit.dart';
import '../repo/unit.dart';

class TileScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final tileListCubit = context.read<TileListCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lager'),
      ),
      drawer: const IntegrationDashboardDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                tileListCubit.searchTiles(value);
              },
              decoration: const InputDecoration(
                labelText: 'Suche nach Lagermaterial',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<TileListCubit, List<TileModel>>(
              builder: (context, tileList) {
                return ListView.separated(
                  itemCount: tileList.length,
                  itemBuilder: (context, index) {
                    final tile = tileList[index];
                    return ListTile(
                      title: Text(tile.description),
                      subtitle: Text('ID ${tile.number}'),
                      leading: ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 50,
                          minHeight: 50,
                          maxWidth: 70,
                          maxHeight: 70,
                        ),
                        child: Image.asset(tile.imagePath, fit: BoxFit.cover),
                      ), // Placeholder for image
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
