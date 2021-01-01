import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wathare/models/chapter_response.dart';

class ChapterRepository {
  final String apiKey = "8a1227b5735a7322c4a43a461953d4ff";
  final String chapterUrl = "https://wathare.herokuapp.com/";

  Future<ChapterResponse> getChapters() async {
    try {
      final response = await http.get(chapterUrl);
      Map<String, dynamic> jsonresponse = json.decode(response.body)[0];
      return ChapterResponse.fromJson(jsonresponse);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ChapterResponse.withError("$error");
    }
  }
}
