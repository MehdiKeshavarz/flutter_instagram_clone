import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/profile/widgets/profile_form_widget.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: const Text('Edit Profile'),
        leading: GestureDetector(
            onTap: () =>  Navigator.pop(context),
            child:const  Icon(Icons.close,size: 30,)),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.done, color: Colors.blue,size: 30,))
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(60)
                ),
              ),
            ),
            sizeVer(15),
            const Center(
              child: Text('change profile photo',style: TextStyle(color: blueColor,fontSize: 20,fontWeight: FontWeight.w400),),
            ),
            sizeVer(15),
            ProfileFormWidget(title: 'Name'),
            sizeVer(15),
            ProfileFormWidget(title: 'UserName'),
            sizeVer(15),
            ProfileFormWidget(title: 'Website'),
            sizeVer(15),
            ProfileFormWidget(title: 'Bio'),

          ],
        ),
      )
    );
  }
}
