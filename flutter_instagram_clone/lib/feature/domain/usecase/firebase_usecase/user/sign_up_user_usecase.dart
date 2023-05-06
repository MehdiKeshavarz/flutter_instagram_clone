import '../../../../../core/use_case/use_case.dart';
import '../../../entities/user/user_entity.dart';
import '../../../repository/firebase_repository.dart';

class SignInUserUseCase extends UseCase<void,UserEntity>{
  FirebaseRepository repository;
  SignInUserUseCase({required this.repository});

  @override
  Future<void> call(UserEntity params) {
    return repository.signUpUser(params);
  }

}