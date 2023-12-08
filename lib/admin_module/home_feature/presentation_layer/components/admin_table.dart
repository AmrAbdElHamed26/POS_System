import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_proj/admin_module/home_feature/presentation_layer/controller/admin_home_bloc.dart';
import 'package:side_proj/admin_module/home_feature/presentation_layer/controller/admin_home_states.dart';
import '../../../../shared/enums.dart';

class AdminTable extends StatelessWidget {
  final IconData currentIcon;
  final String tableName;
  final bool additionState;

  final bool iconState;
  final int numberOfTable;

  const AdminTable({
    Key? key,
    required this.currentIcon,
    required this.tableName,
    required this.additionState,
    required this.iconState,
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
                  if (iconState == true)
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.more_vert,
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
                buildWhen: (previous, current) {
              if (numberOfTable == 1) {
                return previous.allNotesState != current.allNotesState;
              } else if (numberOfTable == 2) {
                return previous.allNotesState != current.allNotesState;
              } else {
                return previous.allToDoListState != current.allToDoListState;
              }
            }, builder: (BuildContext context, AdminHomeStates state) {
              if (numberOfTable == 1 || numberOfTable == 2) {
                if (numberOfTable == 1) {
                  switch (state.allNotesState) {
                    case RequestState.loading:
                      return const Center(child: CircularProgressIndicator());
                    case RequestState.loaded:
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.allNotesData.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 4, bottom: 4),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 4,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      state.allNotesData[index].message,
                                      maxLines: 2,
                                      overflow: TextOverflow
                                          .ellipsis, // Add ellipsis for overflowed text
                                    ),
                                  ],
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
                } else if (numberOfTable == 2) {
                  switch (state.allNotesState) {
                    case RequestState.loading:
                      return const Center(child: CircularProgressIndicator());
                    case RequestState.loaded:
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.allNotesData.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 4, bottom: 4),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 4,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      state.allNotesData[index].message,
                                      maxLines: 2,
                                      overflow: TextOverflow
                                          .ellipsis, // Add ellipsis for overflowed text
                                    ),
                                  ],
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
                  switch (state.allToDoListState) {
                    case RequestState.loading:
                      return const Center(child: CircularProgressIndicator());
                    case RequestState.loaded:
                      {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: state.allTodDoList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 4, bottom: 4),
                                child: Row(
                                  children: [
                                    state.allTodDoList[index].messageState ==
                                            "true"
                                        ? Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                                // Set the border color to black
                                                width:
                                                    1, // Set the border width as needed
                                              ),
                                            ),
                                            // Adjust the height as needed
                                            child: const Icon(
                                              Icons.check,
                                              color: Colors.black,
                                              weight: 100,
                                              size: 12,
                                            ),
                                          )
                                        : Container(
                                            width: 12,
                                            height: 12,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      state.allTodDoList[index].message,
                                      maxLines: 2,
                                      overflow: TextOverflow
                                          .ellipsis, // Add ellipsis for overflowed text
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                    case RequestState.error:
                      return const Center(child: CircularProgressIndicator());
                    case RequestState.initial:
                      return const Center(child: CircularProgressIndicator());
                  }
                }
              }
              else {
                // *********** IDK What should happen here ***********
                return const Center(child: CircularProgressIndicator());
              }
            })
          ],
        ));
  }
}
