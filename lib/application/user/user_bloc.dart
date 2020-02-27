import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nociapp/application/user/user_event.dart';
import 'package:nociapp/application/user/user_state.dart';
import 'package:nociapp/infrastructure/repository/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({@required this.userRepository}): assert(userRepository != null);

  @override
  UserState get initialState => Initial();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async*{
    if (event is Request) {
      yield Loading();

      userRepository.fetchUser();
      yield Completed();

      yield UserStream(userStream: userRepository.user);
    }
  }
}