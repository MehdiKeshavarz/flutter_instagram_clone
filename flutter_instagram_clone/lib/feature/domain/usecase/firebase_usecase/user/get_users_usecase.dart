

import 'package:flutter_instagram_clone/feature/domain/entities/user/user_entity.dart';
import 'package:flutter_instagram_clone/feature/domain/repository/firebase_repository.dart';

class GetUsersUseCase{
  FirebaseRepository repository;
  GetUsersUseCase({required this.repository});

  Stream<List<UserEntity>> call(UserEntity user){
    return repository.getUsers(user);
  }
}