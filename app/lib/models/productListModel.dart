import 'dart:convert';

ProductListModel productModelFromJson(String str) =>
    ProductListModel.fromJson(json.decode(str));

String productModelToJson(ProductListModel data) => json.encode(data.toJson());

class ProductListModel {
  ProductListModel({
    required this.data,
  });

  final List<Datum> data;

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      ProductListModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.attributes,
  });

  final int id;
  final AttributesList attributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        attributes: AttributesList.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class AttributesList {
  AttributesList({
    required this.name,
    required this.description,
    required this.price,
    required this.qty,
  });

  final String name;
  final String description;
  final double price;
  final String qty;

  factory AttributesList.fromJson(Map<String, dynamic> json) => AttributesList(
        name: json["Name"],
        description: json["Description"],
        price: json["Price"].toDouble(),
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Description": description,
        "Price": price,
        "qty": qty,
      };
}
