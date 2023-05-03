
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_instagram_clone/constants.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/home/widgets/single_post_card_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: SvgPicture.asset('assets/ic_instagram.svg',color: primaryColor,height: 32,),
        elevation: 0,
        actions:  [
          SizedBox(
            height: 30,
            width: 30,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Image.asset('assets/icon_share.png'),
            ),
          ),
        ],
      ),
      backgroundColor: backGroundColor,
      body:const SinglePostCardWidget()
    );
  }
}
