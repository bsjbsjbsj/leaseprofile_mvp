import 'package:flutter/cupertino.dart';
import 'package:flutter_leaseprofile/model/fakeModel.dart';
import 'package:flutter_leaseprofile/repository/fetchData.dart';

class PostProvider with ChangeNotifier {
  PostRepository _postRepository = PostRepository();
  List<FakeModel> _shops = [];
  List<FakeModel> get shops => _shops;

  Future<List<FakeModel>> getParsed() async {
    _shops = await _postRepository.fetchData();
    notifyListeners();
    return _shops;
  }
}
