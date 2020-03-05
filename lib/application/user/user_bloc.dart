import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nociapp/application/user/user_event.dart';
import 'package:nociapp/application/user/user_state.dart';
import 'package:nociapp/domain/user.dart';
import 'package:nociapp/infrastructure/repository/impl_user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({@required this.userRepository}): assert(userRepository != null);

  @override
  UserState get initialState => Initial();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async*{
    if (event is Request) {
      yield Loading();

      final User user = await userRepository.user();
      yield Completed();

      yield UserStream(user: user);
    }
  }
}