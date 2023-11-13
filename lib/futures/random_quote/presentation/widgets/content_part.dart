import 'package:cleran_architecture_demo/core/utils/app_coolors.dart';
import 'package:cleran_architecture_demo/futures/random_quote/data/models/quote.dart';
import 'package:flutter/material.dart';

class RandomQuoteContentPart extends StatelessWidget {
  const RandomQuoteContentPart({super.key, required this.quote});
  final Quote quote;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        quote.toString(),
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
