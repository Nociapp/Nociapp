import 'dart:async';

import 'package:nociapp/domain/repository/impl_user_repository.dart';
import 'package:nociapp/domain/user.dart';

class UserRepository implements IUserRepository {
  final StreamController<User> _userStream = StreamController();
  Stream<User> get user => _userStream.stream;

  void fetchUser() {
    _userStream.add(User());
  }
}