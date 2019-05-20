import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  String toString();
}

class FetchUsers extends UserEvent {
  @override
  String toString() => 'Fetch User';
}
