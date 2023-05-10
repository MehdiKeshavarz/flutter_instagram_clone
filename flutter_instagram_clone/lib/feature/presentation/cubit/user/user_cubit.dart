import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/user/user_entity.dart';
import '../../../domain/usecase/firebase_usecase/user/get_users_usecase.dart';
import '../../../domain/usecase/firebase_usecase/user/update_user_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UpdateUserUseCase updateUserUseCase;
  final GetUsersUseCase getUserUseCase;

  UserCubit({
    required this.getUserUseCase,
    required this.updateUserUseCase,
  }) : super(UserInitial());


  Future<void> getUsers ({required UserEntity user}) async {
    emit(UserLoading());
    try{
      final streamResponse = getUserUseCase.call(user);
      streamResponse.listen((users) {
        emit(UserLoaded(users: users));
      });
    }on SocketException catch(_){
      emit(UserFailure());
    }catch(_){
      emit(UserFailure());
    }
  }

  Future<void> updateUser ({required UserEntity user}) async {
    try{
      await updateUserUseCase.call(user);

    }on SocketException catch(_){
      emit(UserFailure());
    }catch(_){
      emit(UserFailure());
    }
  }
}
