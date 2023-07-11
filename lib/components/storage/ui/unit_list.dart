import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_flutter_app/misc/widgets/integration_dashboard_drawer.dart';

import '../bloc/unit_list_cubit.dart';
import '../repo/unit.dart';

class TileScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final int? id;
  final String? name;

  TileScreen({this.id, this.name});

  @override
  Widget build(BuildContext context) {
    final tileListCubit = context.read<TileListCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lager'),
      ),
      drawer: const IntegrationDashboardDrawer(),
      body: Column(
        children: <Widget>[
          _widgetSearch(id, name, context),
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

Widget _widgetSearch(int? id, String? name, BuildContext context) {
  final tileListCubit = context.read<TileListCubit>();
  final TextEditingController _searchController = TextEditingController();
  if (id == 2) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          tileListCubit.searchIdTiles(value);
        },
        decoration: InputDecoration(
          labelText: 'Suche nach Ersatzteilen für $name',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  } else {
    return Padding(
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
    );
  }
}
