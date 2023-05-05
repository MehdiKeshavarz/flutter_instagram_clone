import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/credential/sign_in_page.dart';
import 'package:flutter_instagram_clone/feature/presentation/widgets/button_container_widget.dart';
import 'package:flutter_instagram_clone/feature/presentation/widgets/form_container_widget.dart';

import 'package:flutter_svg/flutter_svg.dart';
class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
              Center(
                  child: SvgPicture.asset('assets/ic_instagram.svg',color: primaryColor)),
              sizeVer(15),
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Image.asset('assets/profile_default.png'),
                    ),
                    Positioned(
                      right: -12,
                      bottom: -10,
                      child: IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.add_a_photo,color: blueColor,),
                      ),
                    )

                  ],
                ),
              ),
              sizeVer(30),
              const FormContainerWidget(hintText: 'UserName'),
              sizeVer(15),
              const FormContainerWidget(hintText: 'Email'),
              sizeVer(15),
              const FormContainerWidget(
                hintText: 'Password',
                isPasswordField: true,),
              sizeVer(15),
              const FormContainerWidget(hintText: 'Bio'),
              sizeVer(30),
              ButtonContainerWidget(
                color: blueColor,
                text: 'Sign Up',
                onTapListener: (){

                },
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              const Divider(color: secondaryColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? ", style:  TextStyle(color: primaryColor)),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamedAndRemoveUntil(context, PageConst.signInPage, (route) => false);
                    },
                    child:const Text("Sign In.", style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor)),
                  )

                ],
              )
            ],
          ),
        )
    );
  }
}
