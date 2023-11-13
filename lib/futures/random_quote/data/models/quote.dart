import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final bool success;
  final int timestamp;
  final String base_;
  final DateTime date;

  const Quote({required this.success, required this.timestamp, required this.base_, required this.date});

  @override
  List<Object?> get props => [success, timestamp, base_, date];
}
