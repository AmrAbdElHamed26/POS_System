class itemModel{
  String?  name, restaurantID, categoryID,itemID ;
  int? price;
  itemModel(
      this.name,
      this.price,
      this.restaurantID,
      this.categoryID,
      this.itemID,
      );
  itemModel.fromJson(json)
  {
    name = json['name'];
    price=json['price'];
    restaurantID = json['restaurantID'];
    categoryID=json['categoryID'];
    itemID=json['itemID'];
  }

  Map<String, dynamic> ToMap() {
    return {
      'price': price,
      'name': name,
      'restaurantID': restaurantID,
      'categoryID':categoryID,
      'itemID':itemID,
    };
  }
}