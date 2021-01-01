import 'package:rxdart/rxdart.dart';
import 'package:wathare/models/chapter_response.dart';
import 'package:wathare/repository/repository.dart';

class ChaptersBloc {
  final ChapterRepository _repository = ChapterRepository();
  final BehaviorSubject<ChapterResponse> _subject =
      BehaviorSubject<ChapterResponse>();

  getChapters() async {
    ChapterResponse response = await _repository.getChapters();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ChapterResponse> get subject => _subject;
}

final chaptersBloc = ChaptersBloc();
