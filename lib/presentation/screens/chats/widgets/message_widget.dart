import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:template/data/models/models.dart';
import 'package:template/domain/di/global_dependency.dart';
import 'package:template/domain/di/user_dependency.dart';
import 'package:template/gen/assets.gen.dart';
import 'package:template/gen/colors.gen.dart';
import 'package:template/presentation/screens/profile/profile_view.dart';
import 'package:template/presentation/theme/app_typography.dart';
import 'package:template/presentation/utils/utils.dart';
import 'package:template/presentation/widgets/app_hovered_widget.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:template/presentation/widgets/app_icon_button.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.item,
    this.openThread,
    required this.needSpace,
    required this.index,
    required this.isMine,
    required this.remove,
    required this.createChat,
    required this.allowOpen,
  });

  final MessageResult item;
  final VoidCallback? openThread;
  final Function(int index, String? id) remove;

  final Function(String? id) createChat;
  final bool needSpace;
  final int index;
  final bool isMine;
  final bool allowOpen;

  @override
  Widget build(BuildContext context) {
    final isMobile = defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android;
    if (isMobile) {
      return SwipeActionCell(
        backgroundColor: ColorName.appDarkGrey,
        key: ObjectKey(item),
        trailingActions: [
          if (isMine)
            SwipeAction(
              performsFirstActionWithFullSwipe: true,
              title: "Удалить",
              onTap: (CompletionHandler handler) => remove(index, item.uuid),
              style: AppTypography.sf.s16.w500.white,
              color: ColorName.red,
            ),
          // if (isMine)
          //   SwipeAction(
          //     title: "Изменить",
          //     onTap: (CompletionHandler handler) => remove(index, item.uuid),
          //     style: AppTypography.sf.s16.w500.white,
          //     color: ColorName.red,
          //   ),
          if (openThread != null)
            SwipeAction(
              title: "Ответ",
              onTap: (CompletionHandler handler) => openThread!(),
              style: AppTypography.sf.s16.w500.appGrey,
              color: ColorName.lightGrey,
            ),
        ],
        child: CupertinoButton(
          onPressed: openThread,
          padding: EdgeInsets.zero,
          borderRadius: BorderRadius.zero,
          minSize: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 5,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (item.author?.avatar == null)
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    minSize: 0,
                    onPressed: () =>
                        context.global.dialogService.showCallbackDialog(
                      builder: (ctx) {
                        return ProfileView(
                          authService: context.global.authService,
                          userService: context.user.userService,
                          uploadService: context.global.uploadService,
                          createChat: createChat,
                          id: item.authorId,
                        );
                      },
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Assets.images.avatar.image(),
                        if (item.author?.isOnline ?? false)
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: SizedBox(
                              width: 10,
                              height: 10,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: ColorName.green,
                                  borderRadius: BorderRadius.circular(90),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                else
                  CupertinoButton(
                    onPressed: () {
                      if (allowOpen) {
                        context.global.dialogService.showCallbackDialog(
                          builder: (ctx) {
                            return ProfileView(
                              authService: context.global.authService,
                              userService: context.user.userService,
                              uploadService: context.global.uploadService,
                              createChat: createChat,
                              id: item.authorId,
                            );
                          },
                        );
                      }
                    },
                    padding: EdgeInsets.zero,
                    minSize: 0,
                    child: SizedBox(
                      width: 38,
                      height: 38,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: item.author!.avatar!.url,
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (item.author?.isOnline ?? false)
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: SizedBox(
                                width: 10,
                                height: 10,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: ColorName.green,
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SelectableText(
                            '${item.author?.firstName ?? '-'} ${item.author?.lastName}',
                            style: AppTypography.sf.s15.w600.white,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            Utils.formatDate(
                              item.updatedAt ?? item.createdAt,
                              format: 'hh:mm',
                            ),
                            style: AppTypography.sf.s10.w600.appGrey,
                          ),
                        ],
                      ),
                      const SizedBox(height: 2.5),
                      MarkdownBody(
                        onTapText: () {
                          Clipboard.setData(ClipboardData(text: item.text));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Скопировано!',
                              ),
                            ),
                          );
                        },
                        onTapLink: (text, href, title) {
                          //if (href == null) return;
                          launchUrlString(text);
                        },
                        data: item.text ?? '',
                        selectable: true,
                        styleSheet: MarkdownStyleSheet.fromCupertinoTheme(
                          CupertinoThemeData(
                            textTheme: CupertinoTextThemeData(
                              textStyle: AppTypography.sf.s15.w400.appGrey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      if ((item.threadCount ?? 0) > 0)
                        Text(
                          '${item.threadCount ?? 0} ответа',
                          style: AppTypography.sf.appPurple.s12.w600,
                        ),
                      for (int i = 0; i < item.documentStats.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: CupertinoButton(
                            onPressed: () =>
                                launchUrlString(item.documents[i].url),
                            padding: EdgeInsets.zero,
                            minSize: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Utils.fromMimeType(
                                      item.documentStats[i].contentType),
                                  size: 24,
                                  color: ColorName.appTextGrey,
                                ),
                                Text(
                                  '${item.documentStats[i].name}\n${item.documentStats[i].size.human}',
                                  style: AppTypography.sf.appGrey.s14.w400,
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (needSpace) const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return AppHoveredWidget(
      builder: (context, isHovered) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CupertinoButton(
                onPressed: openThread,
                padding: EdgeInsets.zero,
                color: isHovered ? ColorName.appDarkBlue : null,
                borderRadius: BorderRadius.zero,
                minSize: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 5,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.author?.avatar == null)
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          minSize: 0,
                          onPressed: () {
                            if (allowOpen) {
                              context.global.dialogService.showCallbackDialog(
                                builder: (ctx) {
                                  return ProfileView(
                                    authService: context.global.authService,
                                    userService: context.user.userService,
                                    uploadService: context.global.uploadService,
                                    createChat: createChat,
                                    id: item.authorId,
                                  );
                                },
                              );
                            }
                          },
                          child: Stack(
                            children: [
                              Assets.images.avatar.image(),
                              if (item.author?.isOnline ?? false)
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: SizedBox(
                                    width: 10,
                                    height: 10,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: ColorName.green,
                                        borderRadius: BorderRadius.circular(90),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        )
                      else
                        CupertinoButton(
                          onPressed: () =>
                              context.global.dialogService.showCallbackDialog(
                            builder: (ctx) {
                              return ProfileView(
                                authService: context.global.authService,
                                userService: context.user.userService,
                                uploadService: context.global.uploadService,
                                id: item.authorId,
                                createChat: createChat,
                              );
                            },
                          ),
                          padding: EdgeInsets.zero,
                          minSize: 0,
                          child: SizedBox(
                            width: 38,
                            height: 38,
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 38,
                                  width: 38,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: item.author!.avatar!.url,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                if (item.author?.isOnline ?? false)
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: SizedBox(
                                      width: 10,
                                      height: 10,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: ColorName.green,
                                          borderRadius:
                                              BorderRadius.circular(90),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SelectableText(
                                  '${item.author?.firstName ?? '-'} ${item.author?.lastName}',
                                  style: AppTypography.sf.s15.w600.white,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  Utils.formatDate(
                                    item.updatedAt ?? item.createdAt,
                                    format: 'hh:mm',
                                  ),
                                  style: AppTypography.sf.s10.w600.appGrey,
                                ),
                              ],
                            ),
                            const SizedBox(height: 2.5),
                            MarkdownBody(
                              data: item.text ?? '',
                              onTapText: () {
                                Clipboard.setData(
                                    ClipboardData(text: item.text));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Скопировано!',
                                    ),
                                  ),
                                );
                              },
                              onTapLink: (text, href, title) {
                                if (href == null) return;
                                launchUrlString(href);
                              },
                              selectable: true,
                              styleSheet: MarkdownStyleSheet.fromCupertinoTheme(
                                CupertinoThemeData(
                                  textTheme: CupertinoTextThemeData(
                                    textStyle:
                                        AppTypography.sf.s15.w400.appGrey,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            if ((item.threadCount ?? 0) > 0)
                              Text(
                                '${item.threadCount ?? 0} ответа',
                                style: AppTypography.sf.appPurple.s12.w600,
                              ),
                            for (int i = 0; i < item.documentStats.length; i++)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: CupertinoButton(
                                  onPressed: () => launchUrlString(
                                    item.documents[i].url,
                                  ),
                                  padding: EdgeInsets.zero,
                                  minSize: 0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Utils.fromMimeType(
                                          item.documentStats[i].contentType,
                                        ),
                                        size: 24,
                                        color: ColorName.appTextGrey,
                                      ),
                                      Text(
                                        '${item.documentStats[i].name}\n${item.documentStats[i].size.human}',
                                        style:
                                            AppTypography.sf.appGrey.s14.w400,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (needSpace) const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (isHovered && (openThread != null || isMine))
              Positioned(
                top: 0,
                right: 5,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: ColorName.appLightGrey,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 2),
                        blurRadius: 3,
                        color: ColorName.black.withOpacity(.1),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 3,
                    ),
                    child: Row(
                      children: [
                        if (openThread != null)
                          AppIconButton(
                            icon: Assets.icons.reply,
                            onTap: openThread,
                          ),
                        if (isMine) ...[
                          const SizedBox(width: 5),
                          AppIconButton(
                            onTap: () => remove(index, item.uuid),
                            child: const Icon(
                              Icons.close,
                              color: ColorName.red,
                              size: 16,
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
