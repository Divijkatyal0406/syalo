import 'package:flutter/foundation.dart';

class Habbit {
  final int id;
  final String title;
  final double amount;
  final DateTime date;

  const Habbit({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
