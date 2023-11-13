import 'package:cleran_architecture_demo/core/error/failures.dart';
import 'package:cleran_architecture_demo/core/usecases/use_case.dart';
import 'package:cleran_architecture_demo/core/utils/map_failure.dart';
import 'package:cleran_architecture_demo/futures/random_quote/data/models/quote.dart';
import 'package:cleran_architecture_demo/futures/random_quote/usecases/get_random_quote.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuote getRandomQuoteUseCase;

  RandomQuoteCubit({required this.getRandomQuoteUseCase}) : super(RandomQuoteInitial());

  Future<void> getRandomQuote() async {
    emit(RandomQuoteLoading());
    Either<Failure, Quote> result = await getRandomQuoteUseCase.call(NoParams());

    result.fold(
      (failure) => emit(RandomQuoteError(message: MapFailure.failureToString(failure))),
      (quote) => emit(RandomQuoteLoaded(quote: quote)),
    );
  }
}
