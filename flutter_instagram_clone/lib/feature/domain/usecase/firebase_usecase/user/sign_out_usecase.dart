

import 'package:flutter_instagram_clone/core/use_case/use_case.dart';
import 'package:flutter_instagram_clone/feature/domain/repository/firebase_repository.dart';

class SignOutUseCase extends UseCase<void,NoParams>{
  FirebaseRepository repository;
  SignOutUseCase({required this.repository});

  @override
  Future<void> call(NoParams params) {
    return repository.singOut();
  }

}