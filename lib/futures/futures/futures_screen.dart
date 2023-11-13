import 'package:cleran_architecture_demo/futures/localization/presentation/widgets/app_lang_drop_down.dart';
import 'package:cleran_architecture_demo/futures/theme/presentation/theme_drop_down.dart';
import 'package:flutter/material.dart';

class FuturesPage extends StatefulWidget {
  const FuturesPage({super.key});

  @override
  State<FuturesPage> createState() => _FuturesPageState();
}

class _FuturesPageState extends State<FuturesPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        AppLangDropDown(),
        ThemeDropDown(),
      ],
    );
  }
}
