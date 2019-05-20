import 'package:equatable/equatable.dart';
import 'package:user_bloc/models/models.dart';

abstract class UserState extends Equatable {
  String toString();
}

class UserUninitialized extends UserState {
  @override
  String toString() => 'UserUninitialized';
}

class UserError extends UserState {
  @override
  String toString() => 'UserError';
}

class UserLoaded extends UserState {
  final List<User> userList;

  UserLoaded({this.userList});

  @override
  String toString() => 'UserLoaded';
}
