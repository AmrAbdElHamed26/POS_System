import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_proj/admin_module/home_feature/presentation_layer/controller/admin_home_bloc.dart';
import 'package:side_proj/admin_module/home_feature/presentation_layer/controller/admin_home_states.dart';
import '../../../../shared/enums.dart';

class AdminTable extends StatelessWidget {
  final IconData currentIcon;
  final List<String> data;
  final String tableName;
  final bool additionState;
  final numberOfTable;

  const AdminTable({
    Key? key,
    required this.currentIcon,
    required this.data,
    required this.tableName,
    required this.additionState,
    required this.numberOfTable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 400,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            spreadRadius: 1.2,
            blurRadius: .3,
            offset: Offset.fromDirection(.1),
          )
        ],
        color: Colors.white38.withOpacity(.6),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      currentIcon,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      tableName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                if (additionState == true)
                  GestureDetector(
                    onTap: () {
                      // Add your code to add a note to Firestore here
                      // Example:
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.black.withOpacity(.5),
                    ),
                  ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.3),
                  spreadRadius: .3,
                  blurRadius: .3,
                )
              ],
            ),
          ),
          BlocBuilder<AdminHomeBloc, AdminHomeStates>(
            buildWhen: (previous, current) =>
            previous.allNotesState != current.allNotesState,
            builder: (BuildContext context, AdminHomeStates state) {
              if (numberOfTable == 1 || numberOfTable == 2) {
                switch (state.allNotesState) {
                  case RequestState.loading:
                    return const Center(child: CircularProgressIndicator());
                  case RequestState.loaded:
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.allNotesData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(1.5),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(.08),
                                    spreadRadius: 1.2,
                                    blurRadius: .3,
                                    offset: Offset.fromDirection(.1),
                                  )
                                ],
                                border: Border.all(
                                    color: Colors.black.withOpacity(.3)),
                                borderRadius: BorderRadius.circular(
                                    10.0), // Make the border circular
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  state.allNotesData[index].message,
                                  maxLines: 2,
                                  overflow: TextOverflow
                                      .ellipsis, // Add ellipsis for overflowed text
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  case RequestState.error:
                    return const Center(child: CircularProgressIndicator());
                  case RequestState.initial:
                    return const Center(child: CircularProgressIndicator());
                }
              } else {
                switch (state.allNotesState) {
                  case RequestState.loading:
                    return const Center(child: CircularProgressIndicator());
                  case RequestState.loaded:
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.allNotesData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black), // Add a black border
                                borderRadius: BorderRadius.circular(
                                    10.0), // Make the border circular
                              ),
                              child: Text(
                                state.allNotesData[index].message,
                                maxLines: 2,
                                overflow: TextOverflow
                                    .ellipsis, // Add ellipsis for overflowed text
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  case RequestState.error:
                    return const Center(child: CircularProgressIndicator());
                  case RequestState.initial:
                    return const Center(child: CircularProgressIndicator());
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
