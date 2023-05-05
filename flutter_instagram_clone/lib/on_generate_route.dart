import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/credential/sign_in_page.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/credential/sign_up_page.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/post/comment/comment_page.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/post/update_post_page.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/profile/edit_profile_page.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case PageConst.editProfilePage:
          return routeBuilder(const EditProfilePage());
      case PageConst.updatePostPage:
        return routeBuilder(const UpdatePostPage());
      case PageConst.commentPage:
        return routeBuilder(const CommentPage());
      case PageConst.signInPage:
        return routeBuilder(const SignInPage());
      case PageConst.signUpPage:
        return routeBuilder(const SignUpPage());
      default:
        const NotFoundPage();

    }
  }
}

dynamic routeBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}


class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not found page'),
      ),
      body: const Center(
        child: Text('Not Found Page'),
      ),
    );
  }
}

