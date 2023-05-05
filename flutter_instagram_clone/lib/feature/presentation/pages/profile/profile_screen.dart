import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants.dart';

import 'edit_profile_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          backgroundColor: backGroundColor,
          title: const Text('userName', style: TextStyle(color: primaryColor)),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: InkWell(
                  onTap: () {
                    _openBottomModelSheet(context);
                  },
                  child: const Icon(Icons.menu, color: primaryColor)),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
                            const Text('0',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold)),
                            sizeVer(8),
                            const Text('Posts',
                                style: TextStyle(color: primaryColor)),
                          ],
                        ),
                        sizeHor(22),
                        Column(
                          children: [
                            const Text('54',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold)),
                            sizeVer(8),
                            const Text('Followers',
                                style: TextStyle(color: primaryColor)),
                          ],
                        ),
                        sizeHor(22),
                        Column(
                          children: [
                            const Text('20',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold)),
                            sizeVer(8),
                            const Text('Following',
                                style: TextStyle(color: primaryColor)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                sizeVer(15),
                const Text('Name',
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.bold)),
                sizeVer(12),
                const Text('The Bio of User',
                    style: TextStyle(color: primaryColor)),
                sizeVer(30),
                GridView.builder(
                    itemCount: 32,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0),
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
        ));
  }

  _openBottomModelSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 150,
            decoration: BoxDecoration(color: backGroundColor.withOpacity(0.8)),
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'More Options',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 18),
                      ),
                    ),
                    sizeVer(8),
                    const Divider(thickness: 1, color: secondaryColor),
                    sizeVer(8),
                     Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, PageConst.editProfilePage);
                         // Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
                        },
                          child: const Text('Edit Profile',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16))),
                    ),
                    sizeVer(7),
                    const Divider(thickness: 1, color: secondaryColor),
                    sizeVer(7),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text('Log Out',
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                    ),
                    sizeVer(7),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
