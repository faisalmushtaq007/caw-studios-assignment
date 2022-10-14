import 'dart:convert';

import 'package:caw_studios_assessment/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// light theme and dark theme
class PostProvider extends ChangeNotifier {
  PostModel? postModel;
  bool loading = true;

  resetPostProvider() {
    postModel = null;
    loading = true;
  }

  Future<void> refresh() async{
    resetPostProvider();
    notifyListeners();
    loadPosts();
  }

  Future loadPosts() async {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      final String response =
          await rootBundle.loadString('assets/posts.json');
      final data = json.decode(response);
      postModel = PostModel.fromJson(data);
      loading = false;
      notifyListeners();
    });
  }
}
