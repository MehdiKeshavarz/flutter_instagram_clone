import '../../../../../core/use_case/use_case.dart';
import '../../../entities/user/user_entity.dart';
import '../../../repository/firebase_repository.dart';

class CreateUserUseCase extends UseCase<void, UserEntity>{
  FirebaseRepository repository;
  CreateUserUseCase({required this.repository});

  @override
  Future<void> call(UserEntity params) {
    return repository.createUser(params);
  }

}