import 'package:side_proj/admin_module/menu_feature/domain/entity/item.dart';

class MenuItemModel extends MenuItem {
  const MenuItemModel(
      {required super.id,
      required super.name,
      required super.price,
      required super.categoryId,
      required super.restaurantId});

  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        categoryId: json['categoryId'],
        restaurantId: json['restaurantId']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'categoryId': categoryId,
      'restaurantId': restaurantId,
      'price': price
    };
  }
}
