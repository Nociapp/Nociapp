import 'dart:async';

import 'package:nociapp/domain/repository/user_repository.dart';
import 'package:nociapp/domain/user.dart';

class UserRepository implements IUserRepository {
  @override
  Future<User> user() async{
    return User();
  }
}