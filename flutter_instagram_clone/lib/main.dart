import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/main_screen/main_screen.dart';
import 'package:flutter_instagram_clone/locator.dart';

import 'on_generate_route.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "instagram",
      onGenerateRoute: OnGenerateRoute.route,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen()
      },
    );
  }
}
