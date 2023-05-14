import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/feature/presentation/cubit/auth/auth_cubit.dart';
import 'package:flutter_instagram_clone/feature/presentation/cubit/credential/credential_cubit.dart';
import 'package:flutter_instagram_clone/feature/presentation/cubit/user/user_cubit.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/credential/sign_in_page.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/main_screen/main_screen.dart';
import 'package:flutter_instagram_clone/locator.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'feature/presentation/cubit/user/get_single_user/get_single_user_cubit.dart';
import 'on_generate_route.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<AuthCubit>()..appStarted(context)),
        BlocProvider(create: (_) => di.locator<CredentialCubit>()),
        BlocProvider(create: (_) => di.locator<UserCubit>()),
        BlocProvider(create: (_) => di.locator<GetSingleUserCubit>()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "instagram",
        onGenerateRoute: OnGenerateRoute.route,
        theme: ThemeData.dark(),
        initialRoute: '/',
        routes: {
          '/': (context) {
            return BlocBuilder<AuthCubit,AuthState>(
              builder: (context,authState){
                if(authState is Authenticated){
                  return MainScreen(uid: authState.uid);
                }else{
                  return  const SignInPage();
                }
              },
            );
          }
        },
      ),
    );
  }
}
