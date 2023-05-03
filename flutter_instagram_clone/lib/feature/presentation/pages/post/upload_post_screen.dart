import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants.dart';

class UploadPostScreen extends StatelessWidget {
  const UploadPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('UploadPostScreen',style: TextStyle(color: primaryColor),),
      ),
    );
  }
}
