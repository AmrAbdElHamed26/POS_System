import 'package:side_proj/admin_module/menu_feature/data/models/item_model.dart';
import 'package:side_proj/admin_module/menu_feature/domain/entity/category.dart';

class MenuCategoryModel extends MenuCategory {
  const MenuCategoryModel(
      {required super.id,
      required super.name,
      required super.restaurantId,
      required super.items});

  factory MenuCategoryModel.fromJson(Map<String, dynamic> json) {
    return MenuCategoryModel(
        id: json['id'],
        name: json['name'],
        restaurantId: json['restaurantId'],
        items: json['items'] == null
            ? []
            : List.from(json['items'].json(
                (e) => MenuItemModel.fromJson(e),
              )));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'restaurantId': restaurantId,
      'items': items
    };
  }
}
