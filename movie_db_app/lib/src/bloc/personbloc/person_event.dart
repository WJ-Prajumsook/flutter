import 'package:equatable/equatable.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();
}

class PersonEventStated extends PersonEvent {
  @override
  List<Object> get props => [];
}
