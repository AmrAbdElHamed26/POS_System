import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:side_proj/shared/constants.dart';

import '../../../models/userModel.dart';

abstract class AdminStaffRemoteData{
  Future<void> createUser({
    required String name,
    required String email,
    required String role,
  });
}
class AdminStaffRemoteDataImpl extends AdminStaffRemoteData{
  @override
  Future<void> createUser({required String? name, required String email, String role = 'admin'}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    var restaurant= users.doc(kRestaurantId);
    var staff=restaurant.collection('staff');
    var member=staff.doc();
    userModel model= userModel(email, name,role, kRestaurantId, member.id);
    member.set(model.ToMap());
  }

}