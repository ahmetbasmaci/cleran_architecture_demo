import 'package:cleran_architecture_demo/core/utils/app_coolors.dart';
import 'package:cleran_architecture_demo/futures/random_quote/data/models/quote.dart';
import 'package:cleran_architecture_demo/futures/random_quote/presentation/cubit/cubit/random_quote_cubit.dart';
import 'package:cleran_architecture_demo/futures/random_quote/presentation/widgets/content_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RandomQuotePage extends StatelessWidget {
  const RandomQuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RandomQuoteCubit, RandomQuoteState>(
      builder: (context, state) {
        Widget body = Container();
        if (state is RandomQuoteInitial) {
          print("-----------state is RandomQuoteInitial---------");
          _getRandomQuote(context);
        } else if (state is RandomQuoteLoading) {
          body = _loadingBody();
        } else if (state is RandomQuoteError) {
          body = _errorBody(state);
        } else if (state is RandomQuoteLoaded) {
          body = _resultBody(state.quote);
        }
        return RefreshIndicator(
          onRefresh: () => _getRandomQuote(context),
          child: body,
        );
      },
      listener: (context, state) {
        if (state is RandomQuoteInitial) {
          //  context.read<RandomQuoteCubit>().call();
        } else if (state is RandomQuoteLoading) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Loading"),
              backgroundColor: AppColors.primary,
            ),
          );
        } else if (state is RandomQuoteError) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Quote field to load  ${state.message}"),
              backgroundColor: AppColors.error,
            ),
          );
        } else if (state is RandomQuoteLoaded) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Quote Loaded"),
              backgroundColor: AppColors.succes,
            ),
          );
        }
      },
    );
  }

  Future<void> _getRandomQuote(BuildContext context) async {
    RandomQuoteCubit cubit = BlocProvider.of<RandomQuoteCubit>(context);
    cubit.getRandomQuote();
  }

  Widget _errorBody(RandomQuoteError state) => Center(child: Text(state.message));

  Widget _loadingBody() {
    return Center(
      child: SpinKitDualRing(
        color: AppColors.primary,
        size: 50,
      ),
    );
  }

  Widget _resultBody(Quote quote) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RandomQuoteContentPart(quote: quote),
        ],
      ),
    );
  }
}
