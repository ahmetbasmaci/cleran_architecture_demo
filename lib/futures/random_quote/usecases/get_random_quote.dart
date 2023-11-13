import 'package:cleran_architecture_demo/core/error/failures.dart';
import 'package:cleran_architecture_demo/core/usecases/use_case.dart';
import 'package:cleran_architecture_demo/futures/random_quote/data/models/quote.dart';
import 'package:cleran_architecture_demo/futures/random_quote/data/repositories/quote_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRandomQuote implements UseCase<Quote, NoParams> {
  final QuoteRepository repository;

  GetRandomQuote({required this.repository});
  @override
  Future<Either<Failure, Quote>> call(NoParams params) {
    return repository.getRandomQuote();
  }
}

// this is an example of how to use params in usecase
// if you have parameters in your usecase, you have to change NoParams to your params class
class ExampleParams extends Equatable {
  final int id;
  final String name;

  const ExampleParams({required this.id, required this.name});
  @override
  List<Object?> get props => [id, name];
}
