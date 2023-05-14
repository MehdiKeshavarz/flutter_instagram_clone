import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram_clone/constants.dart';
import 'package:flutter_instagram_clone/feature/presentation/cubit/credential/credential_cubit.dart';
import 'package:flutter_instagram_clone/feature/presentation/widgets/button_container_widget.dart';
import 'package:flutter_instagram_clone/feature/presentation/widgets/form_container_widget.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../cubit/auth/auth_cubit.dart';
import '../main_screen/main_screen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isSignIn = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        body: BlocConsumer<CredentialCubit, CredentialState>(
          listener: (context, credentialState) {
            if (credentialState is CredentialSuccess) {
              BlocProvider.of<AuthCubit>(context).loggedIn();
            }
            if (credentialState is CredentialFailure) {
              toast("Invalid Email and Password");
            }
          },
          builder: (context, credentialState) {
            if (credentialState is CredentialSuccess) {
              return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authState) {
                  if (authState is Authenticated) {
                    return MainScreen(uid: authState.uid);
                  } else {
                    return _bodyWidget();
                  }
                },
              );
            }
            return _bodyWidget();
          },
        ));
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
          sizeVer(30),
          FormContainerWidget(
            controller: _emailController,
            hintText: 'Email',
          ),
          sizeVer(15),
          FormContainerWidget(
            controller: _passwordController,
            hintText: 'Password',
            isPasswordField: true,
          ),
          sizeVer(30),
          ButtonContainerWidget(
            color: blueColor,
            text: 'Sign In',
            onTapListener: () {
              _signInUser();
            },
          ),
          sizeVer(10),
          _isSignIn == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('please wait',
                        style: TextStyle(fontSize: 16, color: primaryColor)),
                    sizeHor(10),
                    const CircularProgressIndicator()
                  ],
                )
              : Container(),
          Flexible(
            flex: 2,
            child: Container(),
          ),
          const Divider(color: secondaryColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have and account? ",
                  style: TextStyle(color: primaryColor)),
              InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, PageConst.signUpPage, (route) => false);
                },
                child: const Text("Sign Up.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: primaryColor)),
              )
            ],
          )
        ],
      ),
    );
  }

  void _signInUser() {
    setState(() {
      _isSignIn = true;
    });
    BlocProvider.of<CredentialCubit>(context)
        .signInUser(
          email: _emailController.text,
          password: _passwordController.text,
        )
        .then((value) => _clear());
  }

  _clear() {
    setState(() {
      _emailController.clear();
      _passwordController.clear();
      _isSignIn = false;
    });
  }
}
