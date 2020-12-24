import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lecture {
  final int standard;
  final String subject;
  final String startTime;
  final String endTime;
  final String currentTime;
  Color color = Colors.green[300];

  Lecture({
    @required this.currentTime,
    @required this.endTime,
    @required this.standard,
    @required this.startTime,
    @required this.subject,
    this.color,
  });
}
