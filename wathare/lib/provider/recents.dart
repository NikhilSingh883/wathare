import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wathare/models/recent.dart';

class Recents with ChangeNotifier {
  List<Recent> _recents = [
    Recent(
      standard: 6,
      subject: 'History',
      color: Colors.red[300],
    ),
    Recent(
      standard: 12,
      subject: 'Civics',
      color: Colors.grey[200],
    ),
    Recent(
      standard: 6,
      subject: 'Maths',
      color: Colors.green[300],
    ),
    Recent(
      standard: 6,
      subject: 'Geo',
      color: Colors.pink[200],
    ),
  ];

  List<Recent> get getRecents {
    return [..._recents];
  }
}
