import 'package:cleran_architecture_demo/core/error/exceptions.dart';
import 'package:cleran_architecture_demo/core/error/failures.dart';
import 'package:cleran_architecture_demo/core/network/network_info.dart';
import 'package:cleran_architecture_demo/futures/random_quote/data/datasorces/random_quote_local_data_source.dart';
import 'package:cleran_architecture_demo/futures/random_quote/data/datasorces/random_quote_remote_data_source.dart';
import 'package:cleran_architecture_demo/futures/random_quote/data/models/quote.dart';
import 'package:cleran_architecture_demo/futures/random_quote/data/repositories/quote_repository.dart';
import 'package:dartz/dartz.dart';

class QuoteRepositoryEmpl extends QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteLocalDataSource localDataSource;
  final RandomQuoteRemoteDataSource remoteDataSource;

  QuoteRepositoryEmpl({required this.networkInfo, required this.localDataSource, required this.remoteDataSource});

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        var result = await remoteDataSource.getRandomQuote();
        await localDataSource.cacheRandomQuote(result);
        return Right(result);
      } on  ServerException{
        return Left(ServerFailure());
      }
    } else {
      try {
        var result = await localDataSource.getRandomQuote();
        return Right(result);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
