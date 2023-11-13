import 'package:flutter/widgets.dart';

extension MediaQueryValues on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get navigationBarHeight => MediaQuery.of(this).padding.bottom;
  double get bottom => MediaQuery.of(this).viewInsets.bottom;
}
