import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: const Text('userName',style: TextStyle(color: primaryColor)),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.menu,color: primaryColor),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          const Text('0',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold)),
                          sizeVer(8),
                          const Text('Posts',style: TextStyle(color: primaryColor)),
                        ],
                      ),
                      sizeHor(22),
                      Column(
                        children: [
                          const Text('54',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold)),
                          sizeVer(8),
                          const Text('Followers',style: TextStyle(color: primaryColor)),
                        ],
                      ),
                      sizeHor(22),
                      Column(
                        children: [
                          const Text('20',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold)),
                          sizeVer(8),
                          const Text('Following',style: TextStyle(color: primaryColor)),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
              sizeVer(15),
             const Text('Name',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold)),
              sizeVer(12),
             const Text('The Bio of User',style: TextStyle(color: primaryColor)),
              sizeVer(30),

              GridView.builder(
                  itemCount: 32,
                  shrinkWrap: true,
                  physics:const ScrollPhysics(),
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      width: 100,
                      color: secondaryColor,
                    );
                  })
            ],
          ),
        ),
      )
    );
  }
}
