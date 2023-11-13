import 'package:cleran_architecture_demo/futures/random_quote/data/models/quote.dart';

class QuoteModel extends Quote {
  const QuoteModel({required success, required timestamp, required base_, required date})
      : super(success: success, timestamp: timestamp, base_: base_, date: date);
  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      success: json['success'],
      timestamp: json['timestamp'],
      base_: json['base'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'timestamp': timestamp,
      'base': base_,
      'date': date.toIso8601String(),
    };
  }

  @override
  String toString() {
    return '''           -- QuoteModel --
    success: $success,
    timestamp: $timestamp,
    base_: $base_,
    date: $date''';
  }
}
