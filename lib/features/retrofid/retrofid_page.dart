import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reto/commons/data/post_entity.dart';
import 'package:reto/features/retrofid/retrofid_controller.dart';

class RetrofidPage extends StatefulWidget {
  const RetrofidPage({super.key});

  @override
  State<RetrofidPage> createState() => _RetrofidPageState();
}

class _RetrofidPageState extends State<RetrofidPage> {
  final retrofidController = RetrofidController();
  // late RetrofidController retrofidController;

  @override
  void initState() {
    // retrofidController = Modular.get<RetrofidController>();
    // retrofidController.fetchData();
    Modular.get<RetrofidController>().fetchData();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // retrofidController.fetchData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      List<PostEntity> posts = Modular.get<RetrofidController>().posts;
      if (posts.isEmpty) {
        return const Center(
            child: CircularProgressIndicator(color: Colors.red));
      }
      return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0xFF3C357C),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFF9747FF)),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: ListTile(
              title: Text('Title:\n${posts[index].title}',
                  style: const TextStyle(color: Colors.white)),
              subtitle: Text('Body:\n${posts[index].body}',
                  style: const TextStyle(color: Colors.white)),
            ),
          );
        },
      );
    });
  }
}
