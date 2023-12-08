import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_proj/admin_module/adminStaff/presentation/staff_screen.dart';
import 'package:side_proj/admin_module/home_feature/presentation_layer/controller/admin_home_bloc.dart';
import 'package:side_proj/admin_module/home_feature/presentation_layer/controller/admin_home_states.dart';
import 'package:side_proj/admin_module/presentation_layer/controller/admin_bloc.dart';
import 'package:side_proj/services/services_locator.dart';

import '../../../../shared/enums.dart';

class HeaderOfAdminHome extends StatelessWidget {
  const HeaderOfAdminHome({Key? key, required this.screenWidth})
      : super(key: key);

  final screenWidth;

  @override
  Widget build(BuildContext context) {
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
                case RequestState.initial:
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
            BlocBuilder<AdminBloc, AdminStates>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {

                    BlocProvider.of<AdminBloc>(context).add(const ChangePageEvent(pageNumber: 4));

                  },
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
                );
              },
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
            BlocBuilder<AdminHomeBloc, AdminHomeStates>(
                buildWhen: (previous, current) =>
                previous.timeAndDateStates != current.timeAndDateStates,
                builder: (BuildContext context, AdminHomeStates state) {
                  return Text(
                    state.timeAndDate,
                    style: TextStyle(
                      color: Colors.grey.withOpacity(.6),
                      fontSize: 15,
                    ),
                  );
                }),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
