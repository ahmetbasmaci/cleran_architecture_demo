part of 'random_quote_cubit.dart';

sealed class RandomQuoteState extends Equatable {
  const RandomQuoteState();

  @override
  List<Object> get props => [];
}

final class RandomQuoteInitial extends RandomQuoteState {}

final class RandomQuoteLoading extends RandomQuoteState {}

final class RandomQuoteLoaded extends RandomQuoteState {
  final Quote quote;

  const RandomQuoteLoaded({required this.quote});

  @override
  List<Object> get props => [quote];
}

final class RandomQuoteError extends RandomQuoteState {
  final String message;

  const RandomQuoteError({required this.message});

  @override
  List<Object> get props => [message];
}
