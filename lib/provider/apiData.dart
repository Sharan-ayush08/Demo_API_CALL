import 'package:demo_project/models/models.dart';
import 'package:flutter/foundation.dart';

class DataClass extends ChangeNotifier {
  Post? _posts;
  bool loading = false;

  getPostData() async {
    loading = true;
    _posts = (await getPostData());
    loading = false;

    notifyListeners();
  }
}
