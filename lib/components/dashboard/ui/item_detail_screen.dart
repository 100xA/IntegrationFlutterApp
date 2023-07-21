import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_flutter_app/components/dashboard/bloc/item_detail_cubit.dart';
import 'package:integration_flutter_app/components/dashboard/bloc/item_detail_state.dart';
import 'package:integration_flutter_app/components/dashboard/ui/dashboardsFixes/fix_template_screen.dart';

import 'package:integration_flutter_app/misc/constants.dart';
import 'package:integration_flutter_app/misc/design/colors.dart';
import 'package:integration_flutter_app/misc/widgets/integration_app_bar.dart';

/// Detailed Information about each [ItemMachine] found in IntegrationDashboard
class ItemDetailScreen extends StatelessWidget {
  final ItemDetailCubit itemDetailCubit;

  const ItemDetailScreen(this.itemDetailCubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemDetailCubit, ItemDetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: IntegrationAppBar(
            title: Text(state.itemMachine.name!),
            showBackButton: true,
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    "Machinennummer: ${state.itemMachine.serialNumber}",
                    style: const TextStyle(
                      color: purpleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Inspektion",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: purpleColor),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          if (state.itemMachine.serialNumber == 8525) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FixTemplateScreen(
                                fixedDescription: fixedDescriptionsList[5],
                              ),
                            ));
                          }
                        },
                        child: Text(
                          fixedDescriptionsList[5].title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          if (state.itemMachine.serialNumber == 8525) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => FixTemplateScreen(
                                      fixedDescription:
                                          fixedDescriptionsList[4])),
                            );
                          }
                        },
                        child: Text(
                          fixedDescriptionsList[4].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Wartung",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: purpleColor),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              if (state.itemMachine.serialNumber == 8525) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => FixTemplateScreen(
                                    fixedDescription: fixedDescriptionsList[3],
                                  ),
                                ));
                              }
                            },
                            child: Text(
                              fixedDescriptionsList[3].title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              if (state.itemMachine.serialNumber == 8525) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => FixTemplateScreen(
                                      fixedDescription:
                                          fixedDescriptionsList[2]),
                                ));
                              }
                            },
                            child: Text(
                              fixedDescriptionsList[2].title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              if (state.itemMachine.serialNumber == 8525) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => FixTemplateScreen(
                                    fixedDescription: fixedDescriptionsList[1],
                                  ),
                                ));
                              }
                            },
                            child: Text(
                              fixedDescriptionsList[1].title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              if (state.itemMachine.serialNumber == 8525) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => FixTemplateScreen(
                                      fixedDescription:
                                          fixedDescriptionsList[0]),
                                ));
                              }
                            },
                            child: Text(
                              fixedDescriptionsList[0].title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const SizedBox(height: 20),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: purpleColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Nächste Instandhaltung: ${state.itemMachine.inspectionTime!.toDate()}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
