// To parse this JSON data, do
//
//     final getHabit = getHabitFromJson(jsonString);

import 'dart:convert';

List<GetHabit> getHabitFromJson(List<dynamic> str) =>
    List<GetHabit>.from(str.map((x) => GetHabit.fromJson(x)));

String getHabitToJson(List<GetHabit> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetHabit {
  GetHabit({
    required this.id,
    required this.name,
    this.image,
    required this.partners,
    required this.v,
  });

  String id;
  String name;
  String? image;
  List<dynamic> partners;
  int v;

  factory GetHabit.fromJson(Map<dynamic, dynamic> json) => GetHabit(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        partners: List<dynamic>.from(json["partners"].map((x) => x)),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
        "partners": List<dynamic>.from(partners.map((x) => x)),
        "__v": v,
      };
}
