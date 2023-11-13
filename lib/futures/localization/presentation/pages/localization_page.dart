import 'package:cleran_architecture_demo/futures/localization/presentation/widgets/app_lang_drop_down.dart';
import 'package:flutter/material.dart';

class LocalizationPage extends StatelessWidget {
  const LocalizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppLangDropDown(),
    );
  }
}
