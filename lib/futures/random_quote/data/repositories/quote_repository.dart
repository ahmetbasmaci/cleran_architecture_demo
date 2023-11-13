import 'package:cleran_architecture_demo/core/error/failures.dart';
import 'package:cleran_architecture_demo/futures/random_quote/data/models/quote.dart';
import 'package:dartz/dartz.dart';

abstract class QuoteRepository {
  Future<Either<Failure, Quote>> getRandomQuote();
}
