import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';
import 'package:michalkubizna/Views/Description/DescriptionView.dart';

class DetailAppView extends StatefulWidget {
  final Color color;
  final tag;
  final String title;
  final String description;
  final List<Image> assets;
  final Widget child;

  DetailAppView({this.color, this.tag, this.title, this.description, this.assets, this.child});

  @override
  _DetailAppViewState createState() => _DetailAppViewState();
}

class _DetailAppViewState extends State<DetailAppView> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Function child = (List<Widget> children) =>
    PlatformUtil().isDesktop(context)
        ? Row(mainAxisAlignment: MainAxisAlignment.center, children: children)
        : SingleChildScrollView(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: children));

    final double number = PlatformUtil().isDesktop(context) ? 2.5 : 1.5;

    return Material(
      color: Colors.transparent,
      child: Stack(children: [
        GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(color: Colors.black54)),
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width / 1.2,
              maxHeight: MediaQuery.of(context).size.height / 1.2,
            ),
            child: Stack(
              children: [
                DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return child([
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.arrow_back_ios),
                                  onPressed: () {
                                    _controller.animateToPage(
                                        _controller.page.toInt() - 1,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease);
                                  }),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxWidth: constraints.maxWidth / number,
                                    maxHeight: constraints.maxWidth / number
                                ),
                                child: PageView(
                                    controller: _controller,
                                    children: widget.assets),
                              ),
                              IconButton(
                                  icon: Icon(Icons.arrow_forward_ios),
                                  onPressed: () {
                                    _controller.animateToPage(
                                        _controller.page.toInt() + 1,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease);
                                  })
                            ]
                        ),
                        DescriptionView(
                            child: widget.child,
                            title: widget.title,
                            description: widget.description
                        ),
                      ]);
                    })),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
