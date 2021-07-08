import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MouseRegionView extends StatefulWidget {
  final Widget Function(bool) buildChild;

  MouseRegionView({
    @required this.buildChild,
  });

  @override
  _MouseRegionViewState createState() => _MouseRegionViewState();
}

class _MouseRegionViewState extends State<MouseRegionView> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (enter) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (exit) {
        setState(() {
          _isHovered = false;
        });
      },
      child: widget.buildChild(_isHovered),
    );
  }
}
