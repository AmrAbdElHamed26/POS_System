import 'package:firebase_auth/firebase_auth.dart';
import 'package:side_proj/admin_module/adminStaff/domain/repos/admin_staff_repo.dart';

import '../../../../shared/constants.dart';
import '../../data/admin_staff_remote_data.dart';

class AdminStaffRepoImpl extends AdminStaffRepo {
  @override
  void addMember({
    required String email,
    required String password,
    required String role,

  }) {


    makeAccount(email, password,role);
  }
}
void  makeAccount(String email,String password,String role)   {
  FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  ).then((value){
    print('RRRRegistration is done');
    print(value.user!.email.toString());
    //Add Data to fireStore
    AdminStaffRemoteDataImpl adminStaffRemoteDataImpl=AdminStaffRemoteDataImpl();
    adminStaffRemoteDataImpl.createUser(name: kName, email: email,role: role);
  }
  ).catchError((error){
    print('ERRORRRRRR'+ error.toString());
  });
}