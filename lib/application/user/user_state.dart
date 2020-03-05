import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nociapp/domain/user.dart';

abstract class UserState extends Equatable {
  UserState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class Initial extends UserState {}

class Loading extends UserState {}

class Completed extends UserState {}

class UserStream extends UserState {
  final User user;

  UserStream({@required this.user}): assert(user != null);
}