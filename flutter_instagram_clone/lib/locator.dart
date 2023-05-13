import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_instagram_clone/feature/data/data_suorces/remote_data_source/remote_data_source.dart';
import 'package:flutter_instagram_clone/feature/data/data_suorces/remote_data_source/remote_data_source_impl.dart';
import 'package:flutter_instagram_clone/feature/data/repository/firebase_repository_impl.dart';
import 'package:flutter_instagram_clone/feature/domain/repository/firebase_repository.dart';
import 'package:flutter_instagram_clone/feature/domain/usecase/firebase_usecase/user/create_user_usecase.dart';
import 'package:flutter_instagram_clone/feature/domain/usecase/firebase_usecase/user/get_current_uid_usecase.dart';
import 'package:flutter_instagram_clone/feature/domain/usecase/firebase_usecase/user/get_single_user_usecase.dart';
import 'package:flutter_instagram_clone/feature/domain/usecase/firebase_usecase/user/get_users_usecase.dart';
import 'package:flutter_instagram_clone/feature/domain/usecase/firebase_usecase/user/is_sign_in_usecase.dart';
import 'package:flutter_instagram_clone/feature/domain/usecase/firebase_usecase/user/sign_in_user_usecase.dart';
import 'package:flutter_instagram_clone/feature/domain/usecase/firebase_usecase/user/sign_out_usecase.dart';
import 'package:flutter_instagram_clone/feature/domain/usecase/firebase_usecase/user/sign_up_user_usecase.dart';
import 'package:flutter_instagram_clone/feature/presentation/cubit/auth/auth_cubit.dart';
import 'package:flutter_instagram_clone/feature/presentation/cubit/credential/credential_cubit.dart';
import 'package:flutter_instagram_clone/feature/presentation/cubit/user/get_single_user/get_single_user_cubit.dart';
import 'package:flutter_instagram_clone/feature/presentation/cubit/user/user_cubit.dart';
import 'package:get_it/get_it.dart';

import 'feature/domain/usecase/firebase_usecase/user/update_user_usecase.dart';

GetIt locator = GetIt.instance();

Future<void> init() async {
  /// Cubit
  locator.registerFactory(() => AuthCubit(
        getCurrentUidUseCase: locator.call(),
        isSignInUseCase: locator.call(),
        signOutUseCase: locator.call(),
      ));

  locator.registerFactory(() => UserCubit(
        getUserUseCase: locator.call(),
        updateUserUseCase: locator.call(),
      ));

  locator.registerFactory(() => CredentialCubit(
        signUpUserUseCase: locator.call(),
        signInUserUseCase: locator.call(),
      ));

  locator.registerFactory(() => GetSingleUserCubit(getSingleUserUseCase: locator.call()));

  /// UseCases
  locator.registerLazySingleton(
      () => SignInUserUseCase(repository: locator.call()));
  locator.registerLazySingleton(() => SignOutUseCase(repository: locator.call()));
  locator.registerLazySingleton(() => GetUsersUseCase(repository: locator.call()));
  locator.registerLazySingleton(() => SignUpUserUseCase(repository: locator.call()));
  locator.registerLazySingleton(() => UpdateUserUseCase(repository: locator.call()));
  locator.registerLazySingleton(() => IsSignInUseCase(repository: locator.call()));
  locator.registerLazySingleton(() => CreateUserUseCase(repository: locator.call()));
  locator.registerLazySingleton(() => GetCurrentUidUseCase(repository: locator.call()));
  locator.registerLazySingleton(() => GetSingleUserUseCase(repository: locator.call()));
  locator.registerLazySingleton(() => GetSingleUserUseCase(repository: locator.call()));

  ///Repository
  locator.registerLazySingleton<FirebaseRepository>(() => FirebaseRepositoryImpl(remoteDataSource: locator.call()));

  ///RemoteDataSource
  locator.registerLazySingleton<FirebaseRemoteDataSource>(
      () => FirebaseRemoteDataSourceImpl(
            firebaseAuth: locator.call(),
            firebaseFirestore: locator.call(),
          ));

  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;


  /// Externals
  locator.registerLazySingleton(() => firebaseFirestore);
  locator.registerLazySingleton(() => firebaseAuth);
}
