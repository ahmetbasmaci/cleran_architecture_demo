import 'package:cleran_architecture_demo/config/locale/app_local.dart';
import 'package:cleran_architecture_demo/core/utils/app_coolors.dart';
import 'package:cleran_architecture_demo/core/utils/app_strings.dart';
import 'package:cleran_architecture_demo/futures/futures/futures_screen.dart';
import 'package:cleran_architecture_demo/futures/random_quote/presentation/cubit/cubit/random_quote_cubit.dart';
import 'package:cleran_architecture_demo/futures/random_quote/presentation/pages/random_quote_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;
  Widget _body = Container();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr(AppStrings.homePage.name)),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.query_builder), label: "Quote"),
          BottomNavigationBarItem(icon: Icon(Icons.translate), label: "Futures"),
        ],
        currentIndex: _currentPageIndex,
        onTap: (index) {
          _currentPageIndex = index;
          if (index == 0) {
            _body = RandomQuotePage();
          } else if (index == 1) {
            _body = FuturesPage();
          }
          setState(() {});
        },
      ),
      body: _body,
      floatingActionButton: _currentPageIndex == 0
          ? FloatingActionButton(
              onPressed: () => _getRandomQuote(context),
              child: Icon(Icons.refresh, color: AppColors.cardBackground),
            )
          : null,
    );
  }

  Future<void> _getRandomQuote(BuildContext context) async {
    RandomQuoteCubit cubit = context.read<RandomQuoteCubit>();
    cubit.getRandomQuote();
  }
}
