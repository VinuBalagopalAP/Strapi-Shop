import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.data,
  });

  Data data;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.attributes,
  });

  int id;
  Attributes attributes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  Attributes({
    required this.title,
    required this.description,
    required this.price,
    required this.qty,
    // required this.variants,
  });

  String title;
  String description;
  double price;
  int qty;
  // int variants;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        // variants: json["variants"],
        title: json["title"],
        description: json["description"],
        price: json["Price"].toDouble(),
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "Price": price,
        "qty": qty,
      };
}
