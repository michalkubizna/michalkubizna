import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_helper/flutter_helper.dart';
import 'package:michalkubizna/MyColors.dart';
import 'package:michalkubizna/Views/EstimateProjectButton.dart';

class AboutMeView extends StatefulWidget {
  @override
  _AboutMeViewState createState() => _AboutMeViewState();
}

class _AboutMeViewState extends State<AboutMeView> {
  @override
  Widget build(BuildContext context) {
//    timeDilation = 5;
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 1000),
      curve: Curves.ease,
      tween: Tween(begin: 0, end: MediaQuery.of(context).size.width),
      builder: (context, width, _) {
        return Container(
          width: width,
          height: MediaQuery.of(context).size.height / 2,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                    foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(colors: [MyColors.darkPurple.withOpacity(0.9), MyColors.darkPurple.withOpacity(0.3)])
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Image.asset("images/introduction.png", fit: BoxFit.cover,)),
                PaddedView(
                  child: DefaultTextStyle(
                    style: TextStyle(color: Colors.white),
                    child: _DescriptionView(),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DescriptionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = PlatformUtil().isDesktop(context)
        ? MediaQuery.of(context).size.width / 2
        : MediaQuery.of(context).size.width;

    return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: width),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ChildrenUtil().getAllPaddedChildren([
              Text("One-stop software development company",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0)),
              Text("Build world-class digital products with a team of design, development and strategy experts. All in one place.",
                  style: TextStyle(fontSize: 20.0)),
              EstimateProjectButton(text: "Get a quote in 48h")
            ], padding: 32)));
  }
}

