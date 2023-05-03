import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ActivityScreen',style: TextStyle(color: primaryColor),),
      ),
    );
  }
}
