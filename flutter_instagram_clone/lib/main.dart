import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/credential/sign_in_page.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/credential/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "instagram",
      theme: ThemeData.dark(),
      home: SignUpPage(),
    );
  }
}
