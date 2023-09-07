import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_proj/admin_module/home_feature/presentation_layer/controller/admin_home_bloc.dart';
import 'package:side_proj/admin_module/home_feature/presentation_layer/controller/admin_home_states.dart';

class HeaderOfAdminHome extends StatelessWidget {
  const HeaderOfAdminHome({Key? key, required this.screenWidth})
      : super(key: key);

  final screenWidth;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminHomeBloc, AdminHomeStates>(
      buildWhen: (previous, current) =>
          previous.timeAndDateStates != current.timeAndDateStates,
      builder: (BuildContext context, AdminHomeStates state) {
        print("date is ${state.timeAndDate}");
        print("name is ${state.userName}");

        /// solve date error
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<AdminHomeBloc, AdminHomeStates>(
                buildWhen: (previous, current) =>
                    previous.userNameStates != current.userNameStates,
                builder: (BuildContext context, AdminHomeStates state) {
                  switch (state.userNameStates) {
                    case RequestState.loading:
                      return const CircularProgressIndicator();
                    case RequestState.loaded:
                      return Text(
                        "Welcome back , ${state.userName}",
                        style: TextStyle(
                            fontSize: 15, color: Colors.black.withOpacity(.6)),
                      );
                    case RequestState.error:
                      return const CircularProgressIndicator();
                  }
                }),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                const Text(
                  "A clean look at your system ,Today ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  width: screenWidth / 2.2,
                ),
                GestureDetector(
                  /// TODO make an action for this button
                  onTap: () {},
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: Colors.black,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_add_alt,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Add Staff",
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.grey.withOpacity(.6),
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  state.timeAndDate,
                  style: TextStyle(
                    color: Colors.grey.withOpacity(.6),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        );
      },
    );
  }
}
