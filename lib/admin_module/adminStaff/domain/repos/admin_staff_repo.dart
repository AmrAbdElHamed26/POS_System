import 'package:flutter/cupertino.dart';
import 'package:side_proj/features/register/data/register_remote_data_source.dart';
import 'package:side_proj/features/register/domain/repos/RegisterRepoImp.dart';

abstract class AdminStaffRepo{
  void addMember({
    required String email,
    required String password,
    required String role,
    required BuildContext context,
});
}
class AdminStaffRepoImpl extends AdminStaffRepo {
  @override
  void addMember({
    required String email,
    required String password,
    required String role,
    required BuildContext context,
  }) {
    // TODO: implement addMember
    RegisterRemoteDataSourceImpl registerRemoteDataSourceImpl=RegisterRemoteDataSourceImpl();
    registerRemoteDataSourceImpl.createUser(name: 'name', email: email,role: role);
    RegisterRepoImpl registerRepoImpl=RegisterRepoImpl();
    registerRepoImpl.user_register(email, password, context);
  }

}