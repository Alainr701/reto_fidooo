// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrofid_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RetrofidController on RetrofidControllerBase, Store {
  late final _$numberAtom =
      Atom(name: 'RetrofidControllerBase.number', context: context);

  @override
  int get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(int value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  late final _$postsAtom =
      Atom(name: 'RetrofidControllerBase.posts', context: context);

  @override
  List<PostEntity> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(List<PostEntity> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  late final _$fetchDataAsyncAction =
      AsyncAction('RetrofidControllerBase.fetchData', context: context);

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  late final _$RetrofidControllerBaseActionController =
      ActionController(name: 'RetrofidControllerBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$RetrofidControllerBaseActionController.startAction(
        name: 'RetrofidControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$RetrofidControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
number: ${number},
posts: ${posts}
    ''';
  }
}
