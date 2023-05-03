import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants.dart';

class UploadPostScreen extends StatelessWidget {
  const UploadPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Center(
        child: Container(
          width: 150,
          height: 150,
          decoration:const BoxDecoration(
            color: secondaryColor,
            shape: BoxShape.circle
          ),
          child: const Center(
            child: Icon(Icons.upload,color: primaryColor,size: 40.0,),
          ),
        ),
      )
    );
  }
}
