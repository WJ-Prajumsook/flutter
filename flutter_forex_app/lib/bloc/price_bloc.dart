import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_forex_app/api/price_repository.dart';
import 'package:flutter_forex_app/model/price.dart';

class PriceBloc extends Bloc<PriceEvent, PriceState> {
  PriceBloc() : super(PriceLoading());

  @override
  Stream<PriceState> mapEventToState(PriceEvent event) async* {
    final priceRepository = PriceRepository();
    yield PriceLoading();
    try {
      final response = await priceRepository.getPriceList();
      yield PriceLoaded(response);
    } on Exception catch (error) {
      yield PriceError(error.toString());
    }
  }
}

abstract class PriceState extends Equatable {
  @override
  List<Object> get props => [];
}

class PriceLoading extends PriceState {}

class PriceLoaded extends PriceState {
  final List<Price> prices;

  PriceLoaded(this.prices);

  @override
  List<Object> get props => [prices];
}

class PriceError extends PriceState {
  final String message;

  PriceError(this.message);

  @override
  List<Object> get props => [message];
}

abstract class PriceEvent extends Equatable {}

class PriceEventStated extends PriceEvent {
  @override
  List<Object> get props => [];
}
