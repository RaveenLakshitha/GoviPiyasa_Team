import 'dart:convert';

class Profile {
  int id;
  String itemname;
  String description;
  int price;
  int quantity;
  String  category;

  Profile({this.id = 0, this.itemname, this.description, this.price,this.quantity,this.category});

  factory Profile.fromJson(Map<String, dynamic> map) {
    return Profile(
        id: map["id"], itemname: map["itemname"], description: map["descrption"], price: map["price"],quantity: map['quantity'],category: map['category']);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "itemname": itemname, "description": description, "price": price,"quantity":quantity,"category":category};
  }

  @override
  String toString() {
    return 'Profile{id: $id, "itemname": itemname, "description": $description, "price": $price,"quantity":$quantity,"category":$category}';
  }

}

List<Profile> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Profile>.from(data.map((item) => Profile.fromJson(item)));
}

String profileToJson(Profile data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
