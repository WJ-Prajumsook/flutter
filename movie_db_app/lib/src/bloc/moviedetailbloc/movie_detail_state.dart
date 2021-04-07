import 'package:equatable/equatable.dart';
import 'package:movie_db_app/src/model/movie_detail.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailError extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetail detail;
  const MovieDetailLoaded(this.detail);

  @override
  List<Object> get props => [detail];
}
