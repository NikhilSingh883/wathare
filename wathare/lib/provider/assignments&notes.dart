import 'package:flutter/cupertino.dart';
import 'package:wathare/models/a&n.dart';

class AssignmentsAndNotes with ChangeNotifier {
  List<AandN> _aN = [];

  List<AandN> get assiandNotes {
    return [..._aN];
  }
}
