import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/domain/di/core/app_dependency_widget.dart';
import 'package:template/domain/di/user_dependency.dart';
import 'package:template/gen/colors.gen.dart';

import 'root_vm.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppDependencyWidget<UserDependency>(
      create: UserDependency.new,
      dispose: (_, dep) => dep.dispose(),
      loadingBuilder: (context) => const Scaffold(
        body: ColoredBox(
          color: ColorName.appDarkBlue,
          child: Center(
            child: CupertinoActivityIndicator(
              color: ColorName.white,
            ),
          ),
        ),
      ),
      child: ViewModelBuilder<RootViewModel>.reactive(
        viewModelBuilder: () => RootViewModel(),
        onViewModelReady: (model) => model.onReady(),
        builder: (context, model, child) {
          return const Scaffold(
            body: AutoRouter(),
          );
        },
      ),
    );
  }
}
