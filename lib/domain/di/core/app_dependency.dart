import 'dart:async';
import 'package:flutter/cupertino.dart';

abstract class AppDependency {
  AppDependency(BuildContext context) {
    init(context).then((value) => inited.complete());
  }
  final Completer inited = Completer();

  Future<void> init(BuildContext context);

  void dispose();
}
