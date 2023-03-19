import 'package:flutter/cupertino.dart';
import 'package:template/gen/assets.gen.dart';
import 'package:template/presentation/theme/app_typography.dart';

class AppExpandedTitle extends StatefulWidget {
  const AppExpandedTitle({
    Key? key,
    required this.title,
    required this.children,
    this.titleButton,
  }) : super(key: key);
  final String title;
  final List<Widget> children;
  final Widget? titleButton;

  @override
  // ignore: library_private_types_in_public_api
  _AppExpandedTitleState createState() => _AppExpandedTitleState();
}

class _AppExpandedTitleState extends State<AppExpandedTitle> {
  bool opened = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoButton(
          onPressed: () {
            setState(() {
              opened = !opened;
            });
          },
          padding: EdgeInsets.zero,
          minSize: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (opened)
                    Assets.icons.dropdown.svg()
                  else
                    RotatedBox(
                      quarterTurns: 2,
                      child: Assets.icons.dropdown.svg(),
                    ),
                  const SizedBox(width: 5),
                  Text(
                    widget.title,
                    style: AppTypography.sf.s15.w500.appGrey,
                  ),
                ],
              ),
              if (widget.titleButton != null) widget.titleButton!,
            ],
          ),
        ),
        if (opened)
          SizedBox(
            height: widget.children.length > 10 ? 200 : widget.children.length * 20,
            child: ListView(
              padding: const EdgeInsets.only(left: 20),
              children: widget.children,
            ),
          ),
      ],
    );
  }
}
