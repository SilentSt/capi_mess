import 'package:flutter/material.dart';

typedef HoveredBuilder = Widget Function(BuildContext context, bool isHovered);

class AppHoveredWidget extends StatefulWidget {
  const AppHoveredWidget({
    Key? key,
    required this.builder,
  }) : super(key: key);
  final HoveredBuilder builder;

  @override
  // ignore: library_private_types_in_public_api
  _AppHoveredWidgetState createState() => _AppHoveredWidgetState();
}

class _AppHoveredWidgetState extends State<AppHoveredWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: widget.builder.call(context, isHovered),
    );
  }
}
