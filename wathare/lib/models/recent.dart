import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wathare/theme.dart';

class Recent {
  final int standard;
  final String subject;
  final DateTime date;
  final Color color;

  Recent({
    @required this.standard,
    @required this.subject,
    this.date,
    this.color,
  });
}
