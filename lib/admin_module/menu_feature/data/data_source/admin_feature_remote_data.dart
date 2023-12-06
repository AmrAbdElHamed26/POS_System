import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../shared/constants.dart';

abstract class AdminMenuRemoteData{
  String createCategory();
  Future<void>addItemData({
    required String categoryName,
    required String categoryItem,
    required String categoryPrice,
    required String categoryId,
});
}
class AdminMenuRemoteDataImpl extends AdminMenuRemoteData{

  @override
  String createCategory() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    var restaurant= users.doc(kRestaurantId);
    var menu=restaurant.collection('menu');
    var category=menu.doc();
    return category.id;
  }
  @override
  Future<void> addItemData({
    required String categoryName,
    required String categoryItem,
    required String categoryPrice,
    required String categoryId,
  }) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    var restaurant= users.doc(kRestaurantId);
    var menu=restaurant.collection('menu');
    var category=menu.doc(categoryId);
    var item=category.collection(categoryId);
  }


}