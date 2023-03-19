import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/domain/di/global_dependency.dart';
import 'package:template/domain/di/user_dependency.dart';
import 'package:template/gen/colors.gen.dart';
import 'package:template/presentation/screens/chats/chats_vm.dart';
import 'package:template/presentation/theme/app_typography.dart';
import 'package:template/presentation/widgets/app_icon_button.dart';

import 'widgets/answers_widget.dart';
import 'widgets/chats_drawer.dart';
import 'widgets/input_window.dart';
import 'widgets/message_widget.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({
    Key? key,
    @QueryParam('chatId') this.chatId,
  }) : super(key: key);

  final String? chatId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatsViewModel>.reactive(
      viewModelBuilder: () => ChatsViewModel(
        chatsService: context.user.chatsService,
        chatSocketService: context.user.chatSocketService,
        authService: context.global.authService,
        messageService: context.user.messageService,
        uploadService: context.global.uploadService,
        documentsService: context.user.documentsService,
        chatId: chatId,
      ),
      onViewModelReady: (viewModel) => viewModel.onViewModelReay(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: ColorName.appDarkGrey,
          key: viewModel.scaffoldKey,
          drawer: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: const ChatsDrawer(),
          ),
          body: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    if (MediaQuery.of(context).size.width > 920)
                      const Flexible(
                        flex: 2,
                        child: ChatsDrawer(),
                      ),
                    Flexible(
                      flex: 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (viewModel.selectedChat == null)
                            const SizedBox(
                              height: 52,
                              child: ColoredBox(
                                color: ColorName.appLightGrey,
                              ),
                            )
                          else
                            SizedBox(
                              height: 52,
                              child: ColoredBox(
                                color: ColorName.appLightGrey,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if (MediaQuery.of(context).size.width <= 920)
                                        AppIconButton(
                                          onTap: () => viewModel.scaffoldKey.currentState?.openDrawer(),
                                          child: const Icon(
                                            Icons.menu,
                                            color: ColorName.white,
                                            size: 18,
                                          ),
                                        ),
                                      if (viewModel.selectedChat?.typeId == 1) ...[
                                        const Icon(Icons.lock),
                                        Text(
                                          '${viewModel.selectedChat?.companion?.firstName ?? '-'} ${viewModel.selectedChat?.companion?.lastName ?? '-'}',
                                          style: AppTypography.sf.s18.w600.white,
                                          textAlign: TextAlign.start,
                                        ),
                                      ] else
                                        Text(
                                          viewModel.selectedChat?.chat?.title ?? '-',
                                          style: AppTypography.sf.s18.w600.white,
                                          textAlign: TextAlign.start,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if (viewModel.selectedChat != null)
                            Expanded(
                              child: ColoredBox(
                                color: ColorName.appDarkGrey,
                                child: ListView.separated(
                                  controller: viewModel.scrollController,
                                  itemBuilder: (context, index) {
                                    final item = viewModel.messages[index];
                                    return MessageWidget(
                                      item: item,
                                      openThread: () => viewModel.openThread(item.uuid),
                                      needSpace: index == viewModel.messages.length - 1,
                                      index: index,
                                      isMine: viewModel.me?.uuid == item.authorId,
                                      remove: viewModel.deleteMessage,
                                      createChat: viewModel.createPrivateChat,
                                      allowOpen: (viewModel.me?.role?.id ?? 0) > (item.author?.role?.id ?? 1),
                                    );
                                  },
                                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                                  itemCount: viewModel.messages.length,
                                ),
                              ),
                            )
                          else
                            const ColoredBox(
                              color: ColorName.appDarkGrey,
                            ),
                          if (viewModel.selectedChat != null)
                            InputWindow(
                              controller: viewModel.messageController,
                              action: (val) => viewModel.sendMessage(null),
                              uploadContent: viewModel.uploadFiles,
                              uploadedCount: viewModel.uploadingFiles.length,
                              uploadingCount: viewModel.files ?? [],
                              removeFile: viewModel.removeFile,
                            ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: double.infinity,
                      width: 1,
                      child: ColoredBox(color: ColorName.appLightGrey),
                    ),
                    if (MediaQuery.of(context).size.width > 700)
                      if (viewModel.selectedChat != null && viewModel.threadId != null)
                        const Flexible(
                          flex: 2,
                          child: AnswersWidget(),
                        ),
                  ],
                ),
                if (MediaQuery.of(context).size.width <= 700)
                  if (viewModel.selectedChat != null && viewModel.threadId != null) const AnswersWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
