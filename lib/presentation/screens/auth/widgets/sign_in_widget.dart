import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/gen/assets.gen.dart';
import 'package:template/gen/colors.gen.dart';
import 'package:template/presentation/screens/auth/auth_vm.dart';
import 'package:template/presentation/theme/app_typography.dart';
import 'package:template/presentation/widgets/app_button.dart';
import 'package:template/presentation/widgets/app_text_button.dart';
import 'package:template/presentation/widgets/app_text_field.dart';

class SignInWidget extends ViewModelWidget<AuthViewModel> {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AuthViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).padding.bottom + 8,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (MediaQuery.of(context).size.width < 500)
            Expanded(
              child: Assets.images.whiteLogo.image(),
            )
          else
            const SizedBox(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  controller: viewModel.phoneController,
                  style: AppTypography.sf.s16.w500.appGrey,
                  title: 'Телефон',
                ),
                const SizedBox(height: 10),
                AppTextField(
                  controller: viewModel.passwordController,
                  style: AppTypography.sf.s16.w500.appGrey,
                  obscure: true,
                  title: 'Пароль',
                  onFinish: viewModel.signIn,
                ),
                if (viewModel.session != null) ...[
                  const SizedBox(height: 10),
                  AppTextField(
                    controller: viewModel.codeController,
                    style: AppTypography.sf.s16.w500.appGrey,
                    title: 'Код',
                    onFinish: viewModel.verify,
                  ),
                ],
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: AppButton(
                    onTap: viewModel.session == null ? viewModel.signIn : viewModel.verify,
                    text: viewModel.session == null ? 'Получить код' : 'Проверить код',
                    textStyle: AppTypography.sf.s16.w500.appGrey,
                    buttonColor: ColorName.appDarkBlue,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 32,
            ),
            child: AppTextButton(
              onTap: viewModel.animateToReg,
              textStyle: AppTypography.sf.s16.w500.appGrey.underlined,
              text: 'Зарегистрироваться',
            ),
          ),
        ],
      ),
    );
  }
}
