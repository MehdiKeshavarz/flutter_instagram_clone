import '../../../../../core/use_case/use_case.dart';
import '../../../repository/firebase_repository.dart';

class GetCurrentUidUseCase extends UseCase<String,NoParams>{
  FirebaseRepository repository;
  GetCurrentUidUseCase({required this.repository});

  @override
  Future<String> call(NoParams params) {
    return repository.getCurrentUid();
  }


}