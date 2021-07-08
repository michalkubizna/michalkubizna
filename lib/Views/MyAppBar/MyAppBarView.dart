import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';
import 'package:michalkubizna/MyColors.dart';
import 'package:michalkubizna/Globals/Datas.dart';
import 'package:michalkubizna/Views/EstimateProjectButton.dart';
import 'package:michalkubizna/Views/MyAppBar/RotatedButtonView.dart';

class MyAppBarView extends StatefulWidget {
  final Key aboutKey;
  final Key appBarKey;
  final Key appsKey;
  final Key reviewsKey;
  final Key contactKey;
  final Function expand;

  MyAppBarView({
    this.appBarKey,
    this.aboutKey,
    this.appsKey,
    this.reviewsKey,
    this.contactKey,
    this.expand
  });

  @override
  _AppBarViewState createState() => _AppBarViewState();
}

class _AppBarViewState extends State<MyAppBarView> {


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            children: [
              ClipRRect(
                child: ColorFiltered(
                    colorFilter: ColorFilter.mode(MyColors.darkPurple.withOpacity(0.2), BlendMode.srcATop),
                    child: Image.asset("images/software_engineer.png", width: 32, height: 32,)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Michal Kubizna", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: MyColors.darkPurple)),
              )
            ],
          ),
        ),
        if (PlatformUtil().isDesktop(context)) Row(
            children: [for (final object in datas)
              RotatedButtonView(globalKey: widget.appBarKey,
                  text: object.title, texts: object.texts)]
        ) else SizedBox.shrink(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Builder(
            builder: (context) {
              final index = PlatformUtil().isDesktop(context) ? 0 : 1;

              final children = [
                EstimateProjectButton(),
                AnimatedIconButton(
                  animatedIconData: AnimatedIcons.menu_close,
                  onPressed: widget.expand,
                  size: 32,
                ),
              ];

              return Stack(
                children: [for (var i = 0; i < children.length; i++)
                  Visibility(
                    visible: index == i,
                    maintainState: true,
                    child: children[i]
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

