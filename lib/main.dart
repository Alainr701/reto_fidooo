import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reto/app.module.dart';
import 'package:reto/styles/app_theme_data.dart';

Future<void> main() async {
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC1XhXU0Mn56PvpFpDs-fEdS-VnVdxQ_5s",
          authDomain: "reto-47853.firebaseapp.com",
          projectId: "reto-47853",
          storageBucket: "reto-47853.appspot.com",
          messagingSenderId: "823748399556",
          appId: "1:823748399556:web:55f377e5063de7b2e51491"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: AppModule(),
      child: Builder(builder: (context) {
        Modular.setInitialRoute('/');
        return MaterialApp.router(
          theme: AppThemeData.lightThemeData,
          darkTheme: AppThemeData.darkThemeData,
          themeMode: ThemeMode.light,
          title: 'Reto',
          routerConfig: Modular.routerConfig,
        );
      }),
    );
  }
}
