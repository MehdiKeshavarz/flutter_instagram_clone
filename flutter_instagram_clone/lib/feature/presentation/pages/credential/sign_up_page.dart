import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram_clone/constants.dart';
import 'package:flutter_instagram_clone/feature/domain/entities/user/user_entity.dart';
import 'package:flutter_instagram_clone/feature/presentation/cubit/auth/auth_cubit.dart';
import 'package:flutter_instagram_clone/feature/presentation/cubit/credential/credential_cubit.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/credential/sign_in_page.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/main_screen/main_screen.dart';
import 'package:flutter_instagram_clone/feature/presentation/widgets/button_container_widget.dart';
import 'package:flutter_instagram_clone/feature/presentation/widgets/form_container_widget.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();


  bool _isSignUP = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        body: BlocConsumer<CredentialCubit, CredentialState>(
          listener: (context, credentialState) {
            if(credentialState is CredentialSuccess){
              BlocProvider.of<AuthCubit>(context).loggedIn();
            }
            if(credentialState is CredentialFailure){
              toast('Invalid Email and Password');
            }
          },
          builder: (context, credentialState) {
            if(credentialState is CredentialSuccess){
              return BlocBuilder<AuthCubit,AuthState>(
                builder: (context,authState){
                  if(authState is Authenticated){
                    return MainScreen(uid: authState.uid);
                  }else{
                    return _bodyWidget();
                  }
                },
              );
            }
            return _bodyWidget();
          },
        )
    );
  }

  _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: Container(),
          ),
          Center(
              child: SvgPicture.asset('assets/ic_instagram.svg',
                  color: primaryColor)),
          sizeVer(15),
          Center(
            child: Stack(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30)),
                  child: Image.asset('assets/profile_default.png'),
                ),
                Positioned(
                  right: -12,
                  bottom: -10,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_a_photo,
                      color: blueColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          sizeVer(30),
          FormContainerWidget(
            controller: _usernameController,
            hintText: 'UserName',
          ),
          sizeVer(15),
          FormContainerWidget(
            hintText: 'Email',
            controller: _emailController,
          ),
          sizeVer(15),
          FormContainerWidget(
            controller: _passwordController,
            hintText: 'Password',
            isPasswordField: true,
          ),
          sizeVer(15),
          FormContainerWidget(
            hintText: 'Bio',
            controller: _bioController,
          ),
          sizeVer(30),
          ButtonContainerWidget(
            color: blueColor,
            text: 'Sign Up',
            onTapListener: () {
              _signUpUser(context);
            },
          ),
          sizeVer(10),
          _isSignUP == true ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('please wait',
                  style: TextStyle(fontSize: 16, color: primaryColor)),
              sizeHor(10),
              const CircularProgressIndicator()
            ],
          ) :
          Container(),
          Flexible(
            flex: 2,
            child: Container(),
          ),
          const Divider(color: secondaryColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account? ",
                  style: TextStyle(color: primaryColor)),
              InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, PageConst.signInPage, (route) => false);
                },
                child: const Text("Sign In.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: primaryColor)),
              )
            ],
          ),

        ],
      ),
    );
  }

  void _signUpUser(context) {
    setState(() {
      _isSignUP = true;
    });
    BlocProvider.of<CredentialCubit>(context).signUpUser(
      user: UserEntity(
          email: _emailController.text,
          username: _usernameController.text,
          password: _passwordController.text,
          bio: _bioController.text,
          totalPosts: 0,
          totalFollowers: 0,
          totalFollowing: 0,
          followers: [],
          following: [],
          profileUrl: '',
          website: '',
          name: ''
      ),
    ).then((value) => _clear());
  }

  _clear() {
    setState(() {
      _emailController.clear();
      _passwordController.clear();
      _bioController.clear();
      _usernameController.clear();
      _isSignUP = false;
    });
  }
}
