import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/admin_navigation_items.dart';
import '../controller/admin_bloc.dart';

class AdminNavigationBar extends StatelessWidget {
  const AdminNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      flex: screenWidth > 800 ? 1 : 2,
      child: Container(
        width: screenWidth > 800 ? 250 : 70,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.3),
              spreadRadius: 5,
              blurRadius: 2,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://hips.hearstapps.com/hmg-prod/images/lionel-messi-celebrates-after-their-sides-third-goal-by-news-photo-1686170172.jpg?crop=0.66653xw:1xh;center,top&resize=1200:*',
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: adminNavigationItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<AdminBloc>(context)
                            .add(ChangePageEvent(pageNumber: index));
                      },
                      child: SizedBox(
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BlocBuilder<AdminBloc, AdminStates>(
                              builder: (context, state) {
                                var iconColor = Colors.black;
                                if (state is CurrentPageChangedState) {
                                  iconColor = state.pageNumber == index
                                      ? Colors.red
                                      : Colors.black;
                                  print(state.pageNumber);
                                  print("change page ");
                                }
                                return Icon(
                                  adminNavigationItems[index].icon,
                                  color: iconColor,
                                );
                              },
                            ),
                            Text(
                              screenWidth > 800
                                  ? adminNavigationItems[index].name
                                  : "",
                              style: TextStyle(
                                  fontSize:
                                      14 // Adjust text size based on screen size
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
