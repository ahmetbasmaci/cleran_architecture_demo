import 'dart:convert';
import 'package:cleran_architecture_demo/core/error/exceptions.dart';
import 'package:cleran_architecture_demo/core/local_storage/local_storage/i_local_storage.dart';
import 'package:cleran_architecture_demo/core/utils/app_strings.dart';
import 'package:cleran_architecture_demo/futures/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getRandomQuote();
  Future<void> cacheRandomQuote(QuoteModel quote);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  ILocalStorage localStorage;

  RandomQuoteLocalDataSourceImpl({required this.localStorage});
  @override
  Future<QuoteModel> getRandomQuote() {
    String quoteJson = localStorage.read(AppStrings.chachedRandomQuote.name) ?? "";
    if (quoteJson != '') {
      QuoteModel quote = QuoteModel.fromJson(json.decode(quoteJson));
      return Future.value(quote);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheRandomQuote(QuoteModel quote) {
    String quoteJson = json.encode(quote.toJson());
    localStorage.write(AppStrings.chachedRandomQuote.name, quoteJson);
    return Future.value();
  }
}
