import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/gen/assets.gen.dart';
import 'package:template/gen/colors.gen.dart';
import 'package:template/presentation/screens/auth/auth_vm.dart';
import 'package:template/presentation/theme/app_typography.dart';
import 'package:template/presentation/widgets/app_button.dart';
import 'package:template/presentation/widgets/app_text_button.dart';
import 'package:template/presentation/widgets/app_text_field.dart';

class SignUpWidget extends ViewModelWidget<AuthViewModel> {
  const SignUpWidget({Key? key}) : super(key: key);

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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextField(
                    controller: viewModel.loginController,
                    style: AppTypography.sf.s16.w500.appGrey,
                    title: 'Логин',
                  ),
                  const SizedBox(height: 10),
                  AppTextField(
                    controller: viewModel.firstNameController,
                    style: AppTypography.sf.s16.w500.appGrey,
                    title: 'Имя',
                  ),
                  const SizedBox(height: 10),
                  AppTextField(
                    controller: viewModel.lastNameController,
                    style: AppTypography.sf.s16.w500.appGrey,
                    title: 'Фамилия',
                  ),
                  const SizedBox(height: 10),
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
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child: AppButton(
                      onTap: viewModel.signUp,
                      text: 'Зарегистрироваться',
                      textStyle: AppTypography.sf.s16.w500.appGrey,
                      buttonColor: ColorName.appDarkBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32, top: 2),
            child: AppTextButton(
              onTap: viewModel.animateToAuth,
              textStyle: AppTypography.sf.s16.w500.appGrey.underlined,
              text: 'Войти',
            ),
          ),
        ],
      ),
    );
  }
}
