import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:reto/commons/data/post_entity.dart';
import 'package:reto/services/repositories/api_service.dart';

part 'retrofid_controller.g.dart';

class RetrofidController = RetrofidControllerBase with _$RetrofidController;

abstract class RetrofidControllerBase with Store {
  @observable
  int number = 0;

  @observable
  List<PostEntity> posts = [];

  @action
  Future<void> fetchData() async {
    try {
      final Dio dio = Dio();
      final ApiService apiService = ApiService(dio);
      final List<PostEntity> fetchedPosts = await apiService.getPosts();
      posts = fetchedPosts;
      print(posts.length);
    } catch (e) {
      log(e.toString());
    }
  }

  @action
  void increment() {
    number++;
  }
}
