import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/domain/di/global_dependency.dart';
import 'package:template/domain/di/user_dependency.dart';
import 'package:template/gen/assets.gen.dart';
import 'package:template/gen/colors.gen.dart';
import 'package:template/presentation/app/app.dart';
import 'package:template/presentation/screens/profile/profile_view.dart';
import 'package:template/presentation/screens/users/users_view.dart';
import 'package:template/presentation/theme/app_typography.dart';
import 'package:template/presentation/widgets/app_button.dart';
import 'package:template/presentation/widgets/app_expanded_title.dart';
import 'package:template/presentation/widgets/app_icon_button.dart';
import 'package:template/presentation/widgets/app_text_button.dart';

import '../chats_vm.dart';

class ChatsDrawer extends ViewModelWidget<ChatsViewModel> {
  const ChatsDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, ChatsViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 52,
            width: double.infinity,
            child: ColoredBox(
              color: ColorName.appBlue,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: PopupMenuButton<String>(
                  onSelected: (value) => App.router.navigateNamed(value),
                  offset: const Offset(1, 35),
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                  ),
                  splashRadius: 0,
                  constraints: const BoxConstraints(minWidth: 145),
                  color: ColorName.appBlue,
                  itemBuilder: (context) {
                    return <PopupMenuItem<String>>[
                      PopupMenuItem(
                        value: 'dashboard',
                        child: Text(
                          'Дэшборд',
                          style: AppTypography.sf.s16.w500.appGrey,
                        ),
                      ),
                      PopupMenuItem(
                        value: 'chats',
                        child: Text(
                          'Чаты',
                          style: AppTypography.sf.s16.w500.appGrey,
                        ),
                      ),
                    ];
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'CapiMessenger',
                        style: AppTypography.sf.s16.w600.white,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: ColorName.appTextGrey,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: ColorName.appDarkBlue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     left: 16,
                  //     top: 16,
                  //   ),
                  //   child: Text(
                  //     '@ Уведомления',
                  //     style: AppTypography.sf.s15.w500.appGrey,
                  //   ),
                  // ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: AppTextButton(
                      onTap: () => context.global.dialogService.showCallbackDialog(
                        builder: (ctx) {
                          return ProfileView(
                            authService: context.global.authService,
                            userService: context.user.userService,
                            createChat: viewModel.createPrivateChat,
                            uploadService: context.global.uploadService,
                          );
                        },
                      ),
                      text: '@ Мой профиль',
                      textStyle: AppTypography.sf.s15.w500.appGrey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(
                    width: double.infinity,
                    height: 1,
                    child: ColoredBox(
                      color: ColorName.appTextGrey,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: AppExpandedTitle(
                      title: 'Публичные чаты',
                      titleButton: AppIconButton(
                        onTap: () async {
                          final controller = TextEditingController();
                          final res = await context.global.dialogService.showCallbackDialog(
                            builder: (ctx) {
                              return Dialog(
                                backgroundColor: ColorName.appLightGrey,
                                shadowColor: ColorName.black.withOpacity(.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                child: SizedBox(
                                  width: 300,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Публичный чат',
                                          style: AppTypography.sf.s16.w500.white,
                                        ),
                                        const SizedBox(height: 20),
                                        CupertinoTextField(
                                          controller: controller,
                                          decoration: BoxDecoration(
                                            color: ColorName.appDarkBlue.withOpacity(.5),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                        ),
                                        const SizedBox(height: 30),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            AppButton(
                                              onTap: Navigator.of(ctx).pop,
                                              buttonColor: ColorName.appBlue,
                                              textStyle: AppTypography.sf.s14.w500.white,
                                              text: 'Омена',
                                            ),
                                            const SizedBox(width: 10),
                                            AppButton(
                                              onTap: () => Navigator.of(ctx).pop(controller.text),
                                              buttonColor: ColorName.appDarkBlue,
                                              textStyle: AppTypography.sf.s14.w500.white,
                                              text: 'Ок',
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                          if (res == null || res is! String || res.isEmpty) return;
                          viewModel.createPublicChat(res);
                        },
                        child: const Icon(
                          Icons.add,
                          color: ColorName.appTextGrey,
                          size: 16,
                        ),
                      ),
                      children: viewModel.publicChats
                          .map(
                            (e) => CupertinoButton(
                              onPressed: () => viewModel.selectChat(e),
                              padding: EdgeInsets.zero,
                              minSize: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Assets.icons.hash.svg(),
                                      const SizedBox(width: 5),
                                      Text(
                                        e.chat?.title ?? '-',
                                        style: AppTypography.sf.s15.w500.appGrey,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: AppExpandedTitle(
                      title: 'Приватные чаты',
                      titleButton: AppIconButton(
                        onTap: () async {
                          await context.global.dialogService.showCallbackDialog(
                            builder: (ctx) {
                              return UsersView(
                                userService: context.user.userService,
                                onSelectUser: viewModel.createPrivateChat,
                              );
                            },
                          );
                        },
                        child: const Icon(
                          Icons.add,
                          color: ColorName.appTextGrey,
                          size: 16,
                        ),
                      ),
                      children: viewModel.privateChats
                          .map(
                            (e) => CupertinoButton(
                              onPressed: () => viewModel.selectChat(e),
                              padding: EdgeInsets.zero,
                              minSize: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Assets.icons.hash.svg(),
                                  const SizedBox(width: 5),
                                  Text(
                                    e.companion?.login ?? '-',
                                    style: AppTypography.sf.s15.w500.appGrey,
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
