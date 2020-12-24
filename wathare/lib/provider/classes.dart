import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wathare/models/lecture.dart';

class Classes with ChangeNotifier {
  List<Lecture> _lectures = [
    Lecture(
        currentTime: '15:10',
        startTime: '10:00',
        endTime: '10:45',
        standard: 8,
        subject: 'History',
        color: Colors.green[300]),
    Lecture(
      currentTime: '15:10',
      startTime: '10:00',
      endTime: '10:45',
      standard: 5,
      subject: 'History',
      color: Colors.red[300],
    ),
    Lecture(
      currentTime: '15:10',
      startTime: '10:00',
      endTime: '10:45',
      standard: 12,
      subject: 'History',
      color: Colors.purple[300],
    ),
  ];
}
