import '../../../../../core/use_case/use_case.dart';
import '../../../entities/user/user_entity.dart';
import '../../../repository/firebase_repository.dart';

class UpdateUserUseCase extends UseCase<void, UserEntity>{
  FirebaseRepository repository;
  UpdateUserUseCase({required this.repository});

  @override
  Future<void> call(UserEntity params) {
    return repository.updateUser(params);
  }

}