import 'package:flutter/cupertino.dart';
import 'package:template/gen/assets.gen.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    Key? key,
    this.onTap,
    this.icon,
    this.iconColor,
    this.buttonColor,
    this.child,
  }) : super(key: key);

  final VoidCallback? onTap;
  final SvgGenImage? icon;
  final Widget? child;
  final Color? iconColor;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    if(icon==null && child==null){
      throw AssertionError('icon и child не могут быть null');
    }
    return CupertinoButton(
      onPressed: onTap,
      padding: const EdgeInsets.all(5),
      minSize: 0,
      color: buttonColor,
      borderRadius: BorderRadius.circular(12),
      // ignore: deprecated_member_use_from_same_package
      child: child ?? icon!.svg(color: iconColor),
    );
  }
}
