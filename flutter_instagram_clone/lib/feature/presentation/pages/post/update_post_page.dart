import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/profile/widgets/profile_form_widget.dart';

class UpdatePostPage extends StatelessWidget {
  const UpdatePostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGroundColor,
        title: const Text("Edit Post"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.done,color: blueColor,size: 30,),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: secondaryColor,
                    shape: BoxShape.circle
                  ),
                ),
                sizeVer(10),
                const Text('UserName',style: TextStyle(fontSize: 16,color: primaryColor,fontWeight: FontWeight.bold)),
                sizeVer(10),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: secondaryColor
                  ),
                ),
                sizeVer(13),
               const ProfileFormWidget(
                  title: "Description",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
