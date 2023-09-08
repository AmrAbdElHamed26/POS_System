import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/components.dart';

class AdminStaffScreen extends StatelessWidget {

  TextEditingController emailController= new TextEditingController();

  TextEditingController passwordController= new TextEditingController();

  TextEditingController roleController= new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SizedBox(
        width: MediaQuery.sizeOf(context).width/4.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customizedTextFormField(
                textEditingController:  emailController,
                hintText: 'User Name',
                textInputType: TextInputType.name
            ),
            SizedBox(
              height: 25,
            ),
            customizedTextFormField(
                textEditingController: passwordController,
                hintText: 'Password',
                textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: 20,
            ),
            customizedTextFormField(
              textEditingController: roleController,
              hintText: 'Role',
              textInputType: TextInputType.visiblePassword,
            ),

          ],
        ),
      ),
    );
  }
}
