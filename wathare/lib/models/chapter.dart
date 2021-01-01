import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wathare/theme.dart';

class Chapter {
  final int standard;
  final int chapter;
  final String topic;
  final DateTime date;
  final double size;
  final String type;
  final Color color;

  Chapter({
    @required this.standard,
    @required this.chapter,
    @required this.topic,
    this.date,
    this.type = 'PDF',
    this.size = 36.6,
    this.color = AppTheme.chapterD,
  });

  Chapter.fromJson(Map<String, dynamic> json)
      : standard = json["standard"],
        chapter = json["chapter"],
        topic = json["topic"],
        date = DateTime.now(),
        this.type = 'PDF',
        this.size = 36.6,
        this.color = AppTheme.chapterD;
}
