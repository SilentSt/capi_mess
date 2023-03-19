import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/domain/di/global_dependency.dart';
import 'package:template/gen/assets.gen.dart';
import 'package:template/gen/colors.gen.dart';
import 'package:template/presentation/screens/auth/widgets/sign_in_widget.dart';
import 'package:template/presentation/screens/auth/widgets/sign_up_widget.dart';

import 'auth_vm.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(
        authService: context.global.authService,
        dialogService: context.global.dialogService,
      ),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: (context, model, child) {
        if (MediaQuery.of(context).size.width >= 500) {
          return Scaffold(
            backgroundColor: ColorName.appDarkGrey,
            body: Row(
              children: [
                Expanded(
                  child: Assets.images.whiteLogo.image(),
                ),
                Expanded(
                  child: PageView(
                    controller: model.stateController,
                    children: const [
                      SignInWidget(),
                      SignUpWidget(),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Scaffold(
          backgroundColor: ColorName.appDarkGrey,
          body: PageView(
            controller: model.stateController,
            children: const [
              SignInWidget(),
              SignUpWidget(),
            ],
          ),
        );
      },
    );
  }
}
