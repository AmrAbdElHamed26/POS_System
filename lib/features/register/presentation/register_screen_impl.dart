import 'package:flutter/material.dart';
import 'package:side_proj/features/register/data/register_remote_data_source.dart';
import 'package:side_proj/features/register/domain/repos/RegisterRepoImp.dart';
import 'package:side_proj/shared/components.dart';

import '../../login/presentation/login_screen.dart';

class RegisterScreenImpl extends StatefulWidget {
  @override
  State<RegisterScreenImpl> createState() => _RegisterScreenImplState();
}

class _RegisterScreenImplState extends State<RegisterScreenImpl> {
  TextEditingController nameController= new TextEditingController();

  TextEditingController emailController= new TextEditingController();

  TextEditingController passwordController= new TextEditingController();

  bool visibility= true;

  @override
  Widget build(BuildContext context) {
    RegisterRepoImpl registerRepoImp=RegisterRepoImpl();
    RegisterRemoteDataSourceImpl registerRemoteDataSourceImpl=RegisterRemoteDataSourceImpl();
    return Scaffold(
      body: Column(
        children: [
          CustomizedAppBar(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width/4.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 388,
                        height: 84,
                        child: Text(
                          'Build Your own System by Signing up',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      customizedTextFormField(
                          textEditingController: nameController,
                          hintText: 'User name',
                          textInputType: TextInputType.text
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      customizedTextFormField(
                          textEditingController: emailController,
                          hintText: 'Email',
                          textInputType: TextInputType.text
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
                        height: 25,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      CustomizedButton(
                          text: Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          onPressed:(){
                            // save Data in fireStore
                            registerRemoteDataSourceImpl.createUser(
                              name:  nameController.text,
                              email:  emailController.text,

                            );

                            // Auth
                            registerRepoImp.user_register(
                              emailController.text,
                              passwordController.text,
                              context
                            );

                          }

                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have account?',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context)=>LoginScreen())
                              );
                            },
                            child: Text(
                              ' Sign in',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                Image(
                  image: AssetImage('assets/images/register.png'),
                  width: MediaQuery.sizeOf(context).width/2.5,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
