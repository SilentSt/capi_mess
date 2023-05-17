import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/domain/services/auth_service.dart';
import 'package:template/domain/services/upload_service.dart';
import 'package:template/domain/services/user_service.dart';
import 'package:template/gen/assets.gen.dart';
import 'package:template/gen/colors.gen.dart';
import 'package:template/presentation/screens/profile/profile_vm.dart';
import 'package:template/presentation/theme/app_typography.dart';
import 'package:template/presentation/widgets/app_button.dart';
import 'package:template/presentation/widgets/app_icon_button.dart';
import 'package:template/presentation/widgets/app_text_field.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    Key? key,
    this.id,
    required this.authService,
    required this.userService,
    required this.createChat,
    required this.uploadService,
  }) : super(key: key);

  final String? id;
  final AuthService authService;
  final UserService userService;
  final Function(String? id) createChat;
  final UploadService uploadService;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(
        authService: authService,
        userService: userService,
        uploadService: uploadService,
        id: id,
      ),
      onViewModelReady: (viewModel) => viewModel.onViewModelReady(context),
      builder: (context, viewModel, child) {
        if (!viewModel.userExists) {
          return const SizedBox();
        }
        return Dialog(
          backgroundColor: ColorName.appLightGrey,
          shadowColor: ColorName.black.withOpacity(.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          child: SizedBox(
            width: 300,
            height: MediaQuery.of(context).size.height * .7,
            child: ListView(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    if (viewModel.image != null && viewModel.onEdit)
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(26),
                        ),
                        child: Image.memory(
                          viewModel.image!,
                          fit: BoxFit.cover,
                        ),
                      )
                    else if (viewModel.user?.avatar == null)
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(26),
                        ),
                        child: Assets.images.avatar.image(fit: BoxFit.fill),
                      )
                    else
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(26),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: viewModel.user!.avatar!.url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (viewModel.onEdit)
                      AppIconButton(
                        onTap: viewModel.uploadImage,
                        buttonColor: ColorName.appLightGrey.withOpacity(.7),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.image,
                            color: ColorName.appTextGrey,
                            size: 16,
                          ),
                        ),
                      ),
                    if (viewModel.isMe)
                      Positioned(
                        right: 5,
                        top: 5,
                        child: AppIconButton(
                          onTap: viewModel.onEdit
                              ? viewModel.updateUser
                              : viewModel.changeEditStatus,
                          buttonColor: ColorName.appLightGrey.withOpacity(.7),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              viewModel.onEdit ? Icons.check : Icons.edit,
                              color: ColorName.appTextGrey,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 35),
                      if (viewModel.onEdit) ...[
                        AppTextField(
                          controller: viewModel.nameController,
                          style: AppTypography.sf.black.s16,
                        ),
                        const SizedBox(height: 20),
                        AppTextField(
                          controller: viewModel.lastNameController,
                          style: AppTypography.sf.black.s16,
                        ),
                      ] else
                        Text(
                          "${viewModel.user?.firstName ?? ''} ${viewModel.user?.lastName ?? ''}",
                          style: AppTypography.sf.black.w500.s28,
                        ),
                      const SizedBox(height: 20),
                      Text(
                        viewModel.user?.phone ?? '',
                        style: AppTypography.sf.black.s16,
                      ),
                      const SizedBox(height: 20),
                      if (viewModel.onEdit)
                        AppTextField(
                          controller: viewModel.passwordController,
                          title: 'Пароль',
                          style: AppTypography.sf.black.s16,
                          obscure: true,
                        ),
                      const SizedBox(height: 20),
                      Text(
                        viewModel.user?.role?.title ?? '-',
                        style: AppTypography.sf.black.s16,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        viewModel.user?.lastActivity == null
                            ? 'Последний визит: -'
                            : 'Последний визит: ${DateFormat("hh:mm dd.MM.yyyy").format(viewModel.user!.lastActivity!.toLocal())}',
                        style: AppTypography.sf.black.s16,
                      ),
                      if (!viewModel.isMe) ...[
                        const SizedBox(height: 20),
                        AppButton(
                          onTap: () => createChat(id),
                          buttonColor: ColorName.appDarkBlue,
                          textStyle: AppTypography.sf.s15.w500.appGrey,
                          borderRadius: 6,
                          text: 'Написать',
                        ),
                      ],
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
