
import '../../../../../core/use_case/use_case.dart';
import '../../../repository/firebase_repository.dart';

class IsSignInUseCase extends UseCase<bool,NoParams>{
  FirebaseRepository repository;
  IsSignInUseCase({required this.repository});

  @override
  Future<bool> call(NoParams params) {
   return repository.isSignIn();
  }


}