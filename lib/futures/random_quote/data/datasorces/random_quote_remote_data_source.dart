import 'package:cleran_architecture_demo/core/api/api.dart';
import 'package:cleran_architecture_demo/core/api/http_consumer.dart';
import 'package:cleran_architecture_demo/core/error/exceptions.dart';
import 'package:cleran_architecture_demo/futures/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  RandomQuoteRemoteDataSourceImpl();
  @override
  Future<QuoteModel> getRandomQuote() async {
    try {
      HttpConsumer httpConsumer = HttpConsumer();
      final response = QuoteModel.fromJson(await httpConsumer.get(Api.randomQuote));
      return response;
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }
}
