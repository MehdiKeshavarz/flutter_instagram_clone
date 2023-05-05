import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/post/comment/comment_page.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/post/update_post_page.dart';

import '../../../../../constants.dart';

class SinglePostCardWidget extends StatelessWidget {
  const SinglePostCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        color: secondaryColor, shape: BoxShape.circle),
                  ),
                  sizeHor(10),
                  const Text(
                    'UserName',
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
               GestureDetector(
                 onTap: (){
                   _openBottomModelSheet(context);
                 },
                 child: const Icon(
                  Icons.more_vert,
                  color: primaryColor,
              ),
               )
            ],
          ),
          sizeVer(10),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.30,
            color: secondaryColor,
          ),
          sizeVer(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.favorite_outline, color: primaryColor),
                  sizeHor(10),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, PageConst.commentPage);
                      },
                      child: const Icon(Feather.message_circle, color: primaryColor)),
                  sizeHor(10),
                  const Icon(Feather.send, color: primaryColor),
                ],
              ),
              const Icon(Icons.bookmark_border, color: primaryColor),
            ],
          ),
          sizeVer(10),
          const Text('34 likes',
              style:
                  TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
          sizeVer(10),
          Row(
            children: [
              const Text('UserName',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold)),
              sizeHor(10),
              const Text('some description',
                  style: TextStyle(color: primaryColor)),
            ],
          ),
          sizeVer(10),
          const Text('view all 10 comments',
              style: TextStyle(color: darkGreyColor)),
          sizeVer(10),
          const Text('05/07/2023', style: TextStyle(color: darkGreyColor)),
        ],
      ),
    );
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
                           Navigator.pushNamed(context, PageConst.updatePostPage);
                          },
                          child: const Text('Edit Post',
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
                      child: Text('Delete Post',
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
