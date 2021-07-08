import 'dart:async';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';
import 'package:michalkubizna/MyColors.dart';
import 'package:michalkubizna/Models/Data.dart';
import 'package:michalkubizna/Models/Keys.dart';
import 'package:michalkubizna/Views/AboutMe/AboutMeView.dart';
import 'package:michalkubizna/Views/MouserRegionView.dart';
import 'package:michalkubizna/Views/MyAppBar/DrawerView.dart';
import 'package:michalkubizna/Views/MyAppBar/MyAppBarView.dart';
import 'package:michalkubizna/Views/MyAppBar/ExpansionBarView.dart';
import 'package:michalkubizna/Provider/ExpansionProvider.dart';
import 'package:michalkubizna/Views/SlideAnimationView.dart';
import 'package:provider/provider.dart';
part '../Views/AboutMe/_CirclesView.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _streamController.close();
  }

  final StreamController _streamController = StreamController();

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final Keys keys = Keys();

    return ChangeNotifierProvider(
      create: (context) => ExpansionProvider(),
      builder: (context, _) => Scaffold(
        backgroundColor: Colors.white,
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyAppBarView(
                  aboutKey: keys.aboutKey,
                  appBarKey: keys.appBarKey,
                  appsKey: keys.appsKey,
                  reviewsKey: keys.reviewsKey,
                  contactKey: keys.contactKey,
                  expand: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                ),
                Stack(
                  children: [
//                    Column(children: [
////                      AboutMeView(key: keys.aboutKey),
////                      SkillAndInterestView(),
////                      AppsView(key: keys.appsKey),
////                      ReviewView(key: keys.reviewsKey),
////                      ContactView(key: keys.contactKey),
////                      FooterView()
//                    ],),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         _CirclesView(),
                         AboutMeView(),
                       ],
                     ),
                    DrawerView(isExpanded: _isExpanded,),
                    ExpansionBarView()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}