import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/domain/services/user_service.dart';
import 'package:template/gen/assets.gen.dart';
import 'package:template/gen/colors.gen.dart';
import 'package:template/presentation/screens/users/users_vm.dart';
import 'package:template/presentation/theme/app_typography.dart';

class UsersView extends StatelessWidget {
  const UsersView({
    Key? key,
    required this.userService,
    required this.onSelectUser,
  }) : super(key: key);

  final UserService userService;
  final Function(String? uuid) onSelectUser;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UsersViewModel>.reactive(
      viewModelBuilder: () => UsersViewModel(userService: userService),
      onViewModelReady: (viewModel) => viewModel.onViewModelReady(),
      builder: (context, viewModel, child) {
        return Dialog(
          insetPadding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top+32,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).padding.bottom+32
          ),
          backgroundColor: ColorName.appLightGrey,
          shadowColor: ColorName.black.withOpacity(.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Приватный чат',
                  style: AppTypography.sf.s18.w500.white,
                ),
                const SizedBox(height: 20),
                if (viewModel.isBusy)
                  const CupertinoActivityIndicator()
                else ...[
                  CupertinoSearchTextField(
                    controller: viewModel.controller,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final item = viewModel.users[index];
                        return CupertinoButton(
                          onPressed: () => onSelectUser(item.uuid),
                          child: Row(
                            children: [
                              if (item.avatar == null)
                                Assets.images.avatar.image()
                              else
                                SizedBox(
                                  width: 38,
                                  height: 38,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: item.avatar!.url,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.login ?? '-',
                                    style: AppTypography.sf.s15.w600.white,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '${item.firstName ?? '-'} ${item.lastName}',
                                    style: AppTypography.sf.s15.w600.appGrey,
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 10),
                      itemCount: viewModel.users.length,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
