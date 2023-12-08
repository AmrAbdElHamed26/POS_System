import 'dart:core';

import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final String id;
  final String name;
  final int price;
  final String categoryId;
  final String restaurantId;

  const MenuItem(
      {required this.id,
      required this.name,
      required this.price,
      required this.categoryId,
      required this.restaurantId});

  @override
  List<Object?> get props => [id,name,price,categoryId,restaurantId];
}
