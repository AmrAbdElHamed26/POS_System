import 'package:flutter/material.dart';
import 'package:side_proj/admin_module/adminStaff/domain/repos/admin_staff_repo_impl.dart';

import '../../../../shared/components.dart';

class AddTeamMemberTable extends StatefulWidget {
  const AddTeamMemberTable({super.key});


  @override
  State<AddTeamMemberTable> createState() => _AddTeamMemberTableState();
}

class _AddTeamMemberTableState extends State<AddTeamMemberTable> {

  TextEditingController emailController=  TextEditingController();
  TextEditingController passwordController=  TextEditingController();
  String roleDropdownValue = 'Admin';
  bool visibility= true;
  AdminStaffRepoImpl adminStaffRepoImpl=AdminStaffRepoImpl();

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 970,
      height: 210,
      decoration: ShapeDecoration(
        color:const Color(0xFFF7F7F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows:const [
           BoxShadow(
            color:  Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1.50,
                  ),
                ),
                SizedBox(
                  width: 275,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1.50,
                  ),
                ),
                SizedBox(
                  width: 248,
                ),
                Text(
                  'Role',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1.50,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
                children: [
                  SizedBox(
                    width: 300,
                    child: customizedTextFormField(
                      pre:const Icon(Icons.email_outlined),
                        hintText: 'email@gmail.com',
                        textInputType: TextInputType.emailAddress,
                        textEditingController:emailController,
                    ),
                  ),
                  const SizedBox(width: 15,),
                  SizedBox(
                    width:300 ,
                    child: customizedTextFormField(
                      pre: const Icon(
                          Icons.lock_outlined,
                          color: Colors.grey,
                      ),
                        textEditingController: passwordController,
                        hintText: 'Password',
                        textInputType: TextInputType.visiblePassword,
                        suffix: visibility?const Icon(
                          Icons.visibility_outlined,
                          color: Colors.grey,
                        )
                            :const Icon(
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
                  ),
                  const SizedBox(width: 15,),
                  SizedBox(
                    width:300 ,
                    child:Material(
                      elevation: 10.0,
                      shadowColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.transparent, ),
                      ),
                      child: DropdownButtonFormField<String>(
                        decoration:const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        value:roleDropdownValue,
                        items: <String>['Admin', 'Cashier', 'Barista', 'Waiter']
                            .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                              value,
                              style:const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                              ),
                            ),
                        );
                            }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            roleDropdownValue = newValue!;
                          });
                        },

                       ),
                    )
                        ),
                ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Spacer(),
                SizedBox(
                  width: 140,
                  height: 50,
                  child: CustomizedButton(
                      text:
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 15,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                              'Add',
                            style: TextStyle(color: Colors.white, fontSize: 8),
                          ),
                        ],
                      ),

                      onPressed: (){
                        adminStaffRepoImpl.addMember(
                            email: emailController.text,
                            password: passwordController.text,
                            role: roleDropdownValue
                        );
                        emailController.clear();
                        passwordController.clear();
                        setState(() {
                          roleDropdownValue = 'Admin';
                        });
                      }
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
