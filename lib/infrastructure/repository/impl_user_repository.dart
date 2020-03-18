import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:nociapp/domain/repository/user_repository.dart';
import 'package:nociapp/domain/user.dart';

class UserRepository implements IUserRepository {
  @override
  Future<User> user() async{
    var auth = FirebaseAuth.instance;
    var firebaseUser = await auth.currentUser();
    return User(firebaseUser: firebaseUser);
  }
}