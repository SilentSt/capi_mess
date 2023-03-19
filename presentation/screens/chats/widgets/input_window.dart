import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/gen/assets.gen.dart';
import 'package:template/gen/colors.gen.dart';
import 'package:template/presentation/screens/chats/extensions/markdown_extension.dart';
import 'package:template/presentation/theme/app_typography.dart';
import 'package:template/presentation/widgets/app_icon_button.dart';

class InputWindow extends StatelessWidget {
  const InputWindow({
    super.key,
    required this.controller,
    required this.action,
    this.replyId,
    required this.uploadContent,
    required this.uploadingCount,
    required this.uploadedCount,
    required this.removeFile,
  });

  final TextEditingController controller;
  final Function(String? replyId) action;
  final VoidCallback uploadContent;
  final String? replyId;
  final List<String> uploadingCount;
  final int uploadedCount;
  final Function(int index) removeFile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorName.appDarkBlue,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  border: Border.all(
                    color: ColorName.appDarkBlue,
                  ),
                  color: ColorName.appLightGrey,
                ),
                child: Align(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        AppIconButton(
                          icon: Assets.icons.bold,
                          onTap: controller.selectedToBold,
                        ),
                        const SizedBox(
                          width: 1,
                          height: double.infinity,
                          child: ColoredBox(
                            color: ColorName.appTextGrey,
                          ),
                        ),
                        AppIconButton(
                          icon: Assets.icons.italic,
                          onTap: controller.selectedToItalic,
                        ),
                        const SizedBox(
                          width: 1,
                          height: double.infinity,
                          child: ColoredBox(
                            color: ColorName.appTextGrey,
                          ),
                        ),
                        AppIconButton(
                          icon: Assets.icons.crossed,
                          onTap: controller.selectedToCrossed,
                        ),
                        const SizedBox(
                          width: 1,
                          height: double.infinity,
                          child: ColoredBox(
                            color: ColorName.appTextGrey,
                          ),
                        ),
                        AppIconButton(
                          icon: Assets.icons.dotList,
                          onTap: controller.selectedToDotList,
                        ),
                        const SizedBox(
                          width: 1,
                          height: double.infinity,
                          child: ColoredBox(
                            color: ColorName.appTextGrey,
                          ),
                        ),
                        AppIconButton(
                          icon: Assets.icons.numberList,
                          onTap: controller.selectedToNumberList,
                        ),
                        // const SizedBox(
                        //   width: 1,
                        //   height: double.infinity,
                        //   child: ColoredBox(
                        //     color: ColorName.appTextGrey,
                        //   ),
                        // ),
                        // AppIconButton(
                        //   icon: Assets.icons.idk,
                        // ),
                        // const SizedBox(
                        //   width: 1,
                        //   height: double.infinity,
                        //   child: ColoredBox(
                        //     color: ColorName.appTextGrey,
                        //   ),
                        // ),
                        // AppIconButton(
                        //   icon: Assets.icons.code,
                        // ),
                        // const SizedBox(
                        //   width: 1,
                        //   height: double.infinity,
                        //   child: ColoredBox(
                        //     color: ColorName.appTextGrey,
                        //   ),
                        // ),
                        // AppIconButton(
                        //   icon: Assets.icons.idk2,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: controller,
                  style: AppTypography.sf.s16.w500.white,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    hintText: 'Ответить...',
                    hintStyle: AppTypography.sf.s15.w400.appGrey,
                  ),
                  maxLines: 5,
                  minLines: 1,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIconButton(
                    onTap: uploadContent,
                    child: const Icon(
                      Icons.add,
                      size: 18,
                      color: ColorName.appTextGrey,
                    ),
                  ),
                  if (uploadingCount.length == uploadedCount)
                    AppIconButton(
                      onTap: () => action(replyId),
                      icon: Assets.icons.send,
                    )
                ],
              ),
            ),
            if (uploadingCount.isNotEmpty)
              for (int i = 0; i < uploadingCount.length; i++)
                Row(
                  children: [
                    if (i > uploadedCount - 1)
                      const CupertinoActivityIndicator(
                        color: ColorName.appTextGrey,
                      )
                    else
                      const Icon(
                        Icons.check,
                        color: ColorName.appTextGrey,
                      ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        uploadingCount[i],
                        style: AppTypography.sf.s14.w400.appGrey,
                      ),
                    ),
                    AppIconButton(
                      onTap: () => removeFile(i),
                      child: const Icon(
                        Icons.close,
                        size: 16,
                        color: ColorName.red,
                      ),
                    )
                  ],
                )
          ],
        ),
      ),
    );
  }
}
