import '../../../../../core/use_case/use_case.dart';
import '../../../entities/user/user_entity.dart';
import '../../../repository/firebase_repository.dart';

class SignUpUserUseCase extends UseCase<void,UserEntity>{
  FirebaseRepository repository;
  SignUpUserUseCase({required this.repository});

  @override
  Future<void> call(UserEntity params) {
    return repository.signUpUser(params);
  }

}