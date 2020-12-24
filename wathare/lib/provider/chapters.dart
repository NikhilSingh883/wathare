import 'package:flutter/material.dart';
import 'package:wathare/models/chapter.dart';

class Chapters with ChangeNotifier {
  List<Chapter> _chapters = [
    Chapter(
      chapter: 5,
      standard: 8,
      topic: 'Trigonometery',
    ),
    Chapter(
      chapter: 1,
      standard: 5,
      topic: 'Civics',
    ),
    Chapter(
      chapter: 10,
      standard: 8,
      topic: 'Integers',
    ),
    Chapter(
      chapter: 12,
      standard: 12,
      topic: 'Square and Square Root',
    ),
  ];

  List<Chapter> get getChapters {
    return [..._chapters];
  }
}
