import 'package:flutter/cupertino.dart';

extension Dismisskeyboard on Widget {
  void dismisskeyboard() => FocusManager.instance.primaryFocus?.unfocus();
}
