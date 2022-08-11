import 'dart:convert';

String netModelToJson(List<NetModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NetModel {
  NetModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.fullName,
    required this.image,
    required this.price,
    required this.drugId,
  });

  int id;
  String name;
  String slug;
  String fullName;
  String image;
  int price;
  int drugId;

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "full_name": fullName,
        "image": image,
        "price": price,
        "drug_id": drugId,
      };
}
