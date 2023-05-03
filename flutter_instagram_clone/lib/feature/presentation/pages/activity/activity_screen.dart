import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title:const Text('Activity',style: TextStyle(color: primaryColor)),
        elevation: 0,
      ),
      body:Column(
        children: const [
         Text('ActivityScreen')
        ],
      )
    );
  }
}
