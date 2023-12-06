import 'package:equatable/equatable.dart';
import 'package:side_proj/admin_module/menu_feature/domain/entity/item.dart';

class MenuCategory extends Equatable {
  final String id;
  final String name;
  final String restaurantId;
  final List<MenuItem> items;

  const MenuCategory(
      {required this.id,
      required this.name,
      required this.restaurantId,
      required this.items});

  @override
  List<Object?> get props => [id, name, restaurantId, items];
}
