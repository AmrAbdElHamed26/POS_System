import 'package:flutter/material.dart';
import 'package:side_proj/features/login/domain/repos/login_repo_impl.dart';
import 'package:side_sheet/side_sheet.dart';

import '../../../shared/components.dart';

class LoginScreenImpl extends StatefulWidget {
  @override
  State<LoginScreenImpl> createState() => _LoginScreenImplState();
}

class _LoginScreenImplState extends State<LoginScreenImpl> {
  bool visibility= true;

  TextEditingController emailController= new TextEditingController();

  TextEditingController passwordController= new TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginRepoImp loginRepoImp=LoginRepoImp();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          customizedAppBar(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/login.jpg'),
                  width: MediaQuery.sizeOf(context).width/2.5,
                ),
                SizedBox(
                  width: 70,
                ),
                SizedBox(
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
                          suffix: visibility?Icon(
                            Icons.visibility_outlined,
                            color: Colors.grey,
                          )
                              :Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.grey,
                          ),
                          secure: visibility,
                          show: (){
                            setState(() {
                              visibility=!visibility;
                            });
                          }
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: (){
                              print(
                                  'forget pass'
                              );
                            },
                            child: Text(
                              'Forget Password?',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      customizedButton(
                        text: 'Sign in',onPressed:(){
                        loginRepoImp.user_login(
                            emailController.text,
                            passwordController.text,
                            context

                        );
                      },
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width:MediaQuery.sizeOf(context).width/12 ,
                            child: Divider(
                                thickness: 1.5,
                                color: Colors.grey[300]),
                          ),
                          Text(
                            '      or     ',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[600]
                            ),
                          ),
                          SizedBox(
                            width:MediaQuery.sizeOf(context).width/12 ,
                            child: Divider(
                                thickness: 1.5,
                                color: Colors.grey[300]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      googleButton(()=>loginRepoImp.signInWithGoogle()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
