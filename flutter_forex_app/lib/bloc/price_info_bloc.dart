import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_forex_app/api/price_repository.dart';
import 'package:flutter_forex_app/model/price.dart';

class PriceInfoBloc extends Bloc<PriceInfoEvent, PriceInfoState> {
  PriceInfoBloc() : super(PriceInfoLoading());
  @override
  Stream<PriceInfoState> mapEventToState(PriceInfoEvent event) async* {
    if (event is PriceInfoEventStated) {
      final priceRepository = PriceRepository();
      yield PriceInfoLoading();
      try {
        final response = await priceRepository.getPrice(event.instrument);
        yield PriceInfoLoaded(response);
      } on Exception catch (message) {
        yield PriceInfoError(message.toString());
      }
    }
  }
}

abstract class PriceInfoState extends Equatable {
  @override
  List<Object> get props => [];
}

class PriceInfoLoading extends PriceInfoState {}

class PriceInfoLoaded extends PriceInfoState {
  final Price price;

  PriceInfoLoaded(this.price);

  @override
  List<Object> get props => [price];
}

class PriceInfoError extends PriceInfoState {
  final String message;

  PriceInfoError(this.message);

  @override
  List<Object> get props => [message];
}

abstract class PriceInfoEvent extends Equatable {}

class PriceInfoEventStated extends PriceInfoEvent {
  final String instrument;

  PriceInfoEventStated(this.instrument);

  @override
  List<Object> get props => [instrument];
}
