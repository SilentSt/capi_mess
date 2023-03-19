import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/gen/colors.gen.dart';
import 'package:template/presentation/screens/chats/chats_vm.dart';
import 'package:template/presentation/screens/chats/widgets/message_widget.dart';
import 'package:template/presentation/theme/app_typography.dart';

import 'input_window.dart';

class AnswersWidget extends ViewModelWidget<ChatsViewModel> {
  const AnswersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, ChatsViewModel viewModel) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 52,
          child: ColoredBox(
            color: ColorName.appLightGrey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          'Ответы ',
                          style: AppTypography.sf.s18.w600.white,
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(width: 10),
                        if (viewModel.selectedChat?.typeId == 1)
                          Text(
                            '# ${viewModel.selectedChat?.companion?.firstName ?? '-'} ${viewModel.selectedChat?.companion?.lastName ?? '-'}',
                            style: AppTypography.sf.s12.w600.appGrey,
                            textAlign: TextAlign.start,
                          )
                        else
                          Text(
                            '# ${viewModel.selectedChat?.chat?.title ?? '-'}',
                            style: AppTypography.sf.s12.w600.appGrey,
                            textAlign: TextAlign.start,
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 31,
                    height: 31,
                    child: CupertinoButton(
                      onPressed: viewModel.closeThread,
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: ColorName.appLightGrey,
                          boxShadow: [
                            BoxShadow(color: ColorName.black.withOpacity(.4), blurRadius: 3),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.close,
                            color: ColorName.white,
                            size: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ColoredBox(
            color: ColorName.appDarkGrey,
            child: ListView.separated(
              itemBuilder: (context, index) {
                final item = viewModel.threadMessages[index];
                return MessageWidget(
                  item: item,
                  needSpace: index == viewModel.threadMessages.length - 1,
                  index: index,
                  isMine: item.authorId == viewModel.me?.uuid,
                  remove: viewModel.deleteMessage,
                  createChat: viewModel.createPrivateChat,
                  allowOpen: (viewModel.me?.role?.id ?? 0) > (item.author?.role?.id ?? 1),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: viewModel.threadMessages.length,
            ),
          ),
        ),
        InputWindow(
          controller: viewModel.replyController,
          replyId: viewModel.threadId,
          action: (val) => viewModel.sendMessage(val),
          uploadContent: viewModel.uploadFiles,
          uploadedCount: viewModel.uploadingFiles.length,
          uploadingCount: viewModel.files ?? [],
          removeFile: viewModel.removeFile,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
