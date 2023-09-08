import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:side_proj/features/register/data/register_local_data_source.dart';
import 'package:side_proj/models/userModel.dart';

abstract class RegisterRemoteDataSource{
  Future<void> createUser({
    required String name,
    required String email,
    String role='admin',
  });

}
class RegisterRemoteDataSourceImpl extends RegisterRemoteDataSource{
  @override
  Future<void> createUser({
    required String name,
    required String email,
    String role = 'admin'
  }) async {
    RegisterLocalDataSourceImpl registerLocalDataSourceImpl=RegisterLocalDataSourceImpl();
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    var restaurant= users.doc();
    var staff=restaurant.collection('staff');
    var member=staff.doc();
   userModel model= userModel(email, name,role, restaurant.id, member.id);
    member.set(model.ToMap());


    //cashing data
    registerLocalDataSourceImpl.savingLocalData(restaurantID: restaurant.id, uId: member.id);

  }

}