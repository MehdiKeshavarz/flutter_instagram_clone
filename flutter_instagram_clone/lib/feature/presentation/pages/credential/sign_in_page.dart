import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/credential/sign_up_page.dart';
import 'package:flutter_instagram_clone/feature/presentation/widgets/button_container_widget.dart';
import 'package:flutter_instagram_clone/feature/presentation/widgets/form_container_widget.dart';

import 'package:flutter_svg/flutter_svg.dart';
class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:backGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Flexible(
              flex: 2,
              child: Container(),
            ),
            Center(child: SvgPicture.asset('assets/ic_instagram.svg',color: primaryColor)),
            sizeVer(30),
            const FormContainerWidget(
               hintText: 'Email',),
            sizeVer(15),
            const FormContainerWidget(
              hintText: 'Password',
              isPasswordField: true,),
            sizeVer(30),
            ButtonContainerWidget(
              color: blueColor,
              text: 'Sign In',
              onTapListener: (){},
            ),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            const Divider(color: secondaryColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have and account? ", style:  TextStyle(color: primaryColor)),
                InkWell(
                  onTap: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SignUpPage()), (route) => false);
                  },
                  child:const Text("Sign Up.", style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor)),
                )

              ],
            )
          ],
        ),
      )
    );
  }
}
