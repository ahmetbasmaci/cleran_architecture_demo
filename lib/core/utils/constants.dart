import 'package:cleran_architecture_demo/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class Constants {
  static void showErrorDialog({required BuildContext context, required String title, required String message}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text(AppStrings.ok.name))],
      ),
    );
  }
}
