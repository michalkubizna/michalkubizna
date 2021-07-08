import 'package:flutter/material.dart';
import 'package:michalkubizna/Views/DetailApp/DetailAppView.dart';

class PictureView extends StatefulWidget {
  final String title;
  final String description;
  final List<Image> assets;
  final String asset;
  final Widget child;

  PictureView({
    this.title,
    this.description,
    this.assets,
    this.asset,
    this.child
  });

  @override
  _PictureViewState createState() => _PictureViewState();
}

class _PictureViewState extends State<PictureView> {
  final Matrix4 nonHoverTransform = Matrix4.identity();

  final Matrix4 hoverTransform = Matrix4.identity()..translate(0, -10, 0);

  bool _hovering = false;

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        transform: _hovering ? hoverTransform : nonHoverTransform,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(PageRouteBuilder(
              opaque: false,
              pageBuilder: (context, animation, secondaryAnimation) => DetailAppView(title: widget.title, description: widget.description, assets: widget.assets, child: widget.child),
            ));
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(borderRadius: BorderRadius.circular(20.0), child: Container(width: 280.0, child: Image.asset(widget.asset))),
          ),
        ),
      ),
    );
  }
}
