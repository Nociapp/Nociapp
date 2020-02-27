import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  UserEvent([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class Request extends UserEvent {}
