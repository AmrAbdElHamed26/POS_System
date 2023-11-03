import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_proj/shared/components.dart';

import 'components/adding_new_category_table.dart';

class MenuScreenImpl extends StatelessWidget {
  const MenuScreenImpl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: screenHeight / 15,
            left: screenWidth / 12,
            right: screenWidth / 12),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                CustomizedButton(
                  height: 50,
                  width: 250,
                  text: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'Add new category',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) => AddingNewCategoryTable());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
