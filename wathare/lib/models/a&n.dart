import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AandN {
  final int standard;
  final String subject;
  DateTime date = DateTime.now();
  Color color = Colors.brown[300];

  AandN({
    @required this.standard,
    @required this.subject,
    this.date,
    this.color,
  });
}
