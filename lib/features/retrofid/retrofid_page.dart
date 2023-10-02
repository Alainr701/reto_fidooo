import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reto/commons/data/post_entity.dart';
import 'package:reto/services/repositories/api_service.dart';
import 'package:dio/dio.dart';

class RetrofidPage extends StatefulWidget {
  const RetrofidPage({super.key});

  @override
  State<RetrofidPage> createState() => _RetrofidPageState();
}

class _RetrofidPageState extends State<RetrofidPage> {
  late List<PostEntity> posts;
  @override
  void initState() {
    super.initState();
    // _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final Dio dio = Dio();
      final ApiService apiService = ApiService(dio);

      final List<PostEntity> fetchedPosts = await apiService.getPosts();
      setState(() {
        posts = fetchedPosts;
      });
      print('prueba : ${posts[0].body}');
    } catch (e) {
      log(e.toString() as num);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
