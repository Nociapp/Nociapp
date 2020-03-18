import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User {
  final FirebaseUser firebaseUser;

  User({@required this.firebaseUser}): assert(firebaseUser != null);
}