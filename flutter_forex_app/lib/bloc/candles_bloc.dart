import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_forex_app/api/candles_repository.dart';
import 'package:flutter_forex_app/model/candles.dart';

class CandlesBloc extends Bloc<CandlesEvent, CandlesState> {
  CandlesBloc() : super(CandlesLoading());

  @override
  Stream<CandlesState> mapEventToState(CandlesEvent event) async* {
    if (event is CandlesEventStated) {
      final candlesRepository = CandlesRepository();
      yield CandlesLoading();
      try {
        final response = await candlesRepository.getCandles(
            event.instrument, event.granularity);
        yield CandlesLoaded(response);
      } on Exception catch (error) {
        yield CandlesError(error.toString());
      }
    }
  }
}

abstract class CandlesState extends Equatable {
  @override
  List<Object> get props => [];
}

class CandlesLoading extends CandlesState {}

class CandlesLoaded extends CandlesState {
  final Candles candles;

  CandlesLoaded(this.candles);

  @override
  List<Object> get props => [candles];
}

class CandlesError extends CandlesState {
  final String message;

  CandlesError(this.message);

  @override
  List<Object> get props => [message];
}

abstract class CandlesEvent extends Equatable {}

class CandlesEventStated extends CandlesEvent {
  final String instrument;
  final String granularity;

  CandlesEventStated(this.instrument, this.granularity);

  @override
  List<Object> get props => [instrument, granularity];
}
