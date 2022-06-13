// To parse this JSON data, do
//
//     final habit = habitFromJson(jsonString);

import 'dart:convert';

Habit habitFromJson(String str) => Habit.fromJson(json.decode(str));

String habitToJson(Habit data) => json.encode(data.toJson());

class Habit {
  Habit({
    required this.userId,
    required this.name,
    required this.streak,
    required this.repeatDays,
    required this.image,
    required this.timesPerDay,
    required this.reminder,
    required this.reason,
  });

  String userId;
  String name;
  int streak;
  String repeatDays;
  String image;
  int timesPerDay;
  String reminder;
  String reason;

  factory Habit.fromJson(Map<String, dynamic> json) => Habit(
        userId: json["userId"],
        name: json["name"],
        streak: json["streak"],
        repeatDays: json["repeatDays"],
        image: json["image"],
        timesPerDay: json["timesPerDay"],
        reminder: json["reminder"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "streak": streak,
        "repeatDays": repeatDays,
        "image": image,
        "timesPerDay": timesPerDay,
        "reminder": reminder,
        "reason": reason,
      };
}
