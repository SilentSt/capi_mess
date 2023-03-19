import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_dependency.dart';

class AppDependencyWidget<T extends AppDependency> extends Provider<T> {
  AppDependencyWidget({
    super.key,
    required Widget child,
    required T Function(BuildContext context) create,
    required Function(BuildContext context, T data) dispose,
    required WidgetBuilder loadingBuilder,
    required,
  }) : super(
          child: child,
          create: create,
          dispose: dispose,
          builder: (context, child) => FutureBuilder(
            future: context.read<T>().inited.future,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return loadingBuilder(context);
              }
              return child ?? const SizedBox();
            },
          ),
        );
}
