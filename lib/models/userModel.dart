class userModel {
  String? email, name, restaurantID, uID, role;

  userModel(
      this.email,
      this.name,
      this.role,
      this.restaurantID,
      this.uID,
      );

  userModel.fromJson(json)
  {
    email = json['email'];
    name = json['name'];
    restaurantID = json['restaurantID'];
    uID=json['uID'];
    role=json['role'];
  }

  Map<String, dynamic> ToMap() {
    return {
      'email': email,
      'name': name,
      'restaurantID': restaurantID,
      'uID':uID,
      'role':role,
    };
  }
}