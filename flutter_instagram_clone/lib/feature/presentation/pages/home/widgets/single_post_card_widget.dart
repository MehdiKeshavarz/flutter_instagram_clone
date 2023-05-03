import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../../../../constants.dart';
class SinglePostCardWidget extends StatelessWidget {
  const SinglePostCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
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
                    decoration:const BoxDecoration(
                        color: secondaryColor,
                        shape: BoxShape.circle
                    ),
                  ),
                  sizeHor(10),
                  const Text('UserName',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold),),
                ],
              ),
              const Icon(Icons.more_vert,color: primaryColor,)
            ],
          ),
          sizeVer(10),
          Container(
            width:double.infinity,
            height: MediaQuery.of(context).size.height * 0.30,
            color: secondaryColor,
          ),
          sizeVer(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children:[
                  const Icon(Icons.favorite_outline,color: primaryColor),
                  sizeHor(10),
                  const Icon(Feather.message_circle,color: primaryColor),
                  sizeHor(10),
                  const Icon(Feather.send,color: primaryColor),

                ],
              ),
              const Icon(Icons.bookmark_border,color: primaryColor),
            ],
          ),
          sizeVer(10),
         const Text('34 likes',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold)),
          sizeVer(10),
          Row(
            children: [
              const Text('UserName',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold)),
              sizeHor(10),
              const Text('some description',style: TextStyle(color: primaryColor)),
            ],
          ),
          sizeVer(10),
          const Text('view all 10 comments',style: TextStyle(color: darkGreyColor)),
          sizeVer(10),
          const Text('05/07/2023',style: TextStyle(color:darkGreyColor)),

        ],
      ),
    );
  }
}
