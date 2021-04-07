import 'package:equatable/equatable.dart';
import 'package:movie_db_app/src/model/person.dart';

abstract class PersonState extends Equatable {
  const PersonState();

  @override
  List<Object> get props => [];
}

class PersonLoading extends PersonState {}

class PersonError extends PersonState {}

class PersonLoaded extends PersonState {
  final List<Person> personList;
  const PersonLoaded(this.personList);

  @override
  List<Object> get props => [personList];
}
