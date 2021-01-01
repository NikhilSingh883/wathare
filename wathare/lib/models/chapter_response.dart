import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:wathare/models/chapter.dart';
import 'package:http/http.dart' as http;

class ChapterResponse {
  final List<Chapter> chapters;
  final String error;

  ChapterResponse({
    @required this.chapters,
    @required this.error,
  });

  ChapterResponse.fromJson(Map<String, dynamic> json)
      : chapters = (json["chapters"] as List)
            .map((i) => new Chapter.fromJson(i))
            .toList(),
        error = "";

  ChapterResponse.withError(String errorValue)
      : chapters = List(),
        error = errorValue;
}
