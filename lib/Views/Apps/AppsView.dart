import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';
import 'package:michalkubizna/Views/Description/DescriptionView.dart';
import 'package:michalkubizna/Utils/GridUtil.dart';
import 'package:michalkubizna/Views/Picture/PictureView.dart';

class AppsView extends StatefulWidget {
  AppsView({Key key}) : super(key: key);

  @override
  _AppsViewState createState() => _AppsViewState();
}

class _AppsViewState extends State<AppsView> {
  final List<Image> _dingleAssets = [
    Image.asset("images/d_2.png"),
    Image.asset("images/d_3.png")
  ];

  final List<Image> _bleepAssets = [
    Image.asset("images/b_2.png"),
    Image.asset("images/b_3.png")
  ];

  final List<Image> _hyphyAssets = [
    Image.asset("images/h_2.png"),
    Image.asset("images/h_3.png")
  ];

  final List<Image> _deftAssets = [
    Image.asset("images/de_2.png"),
    Image.asset("images/de_3.png"),
    Image.asset("images/de_4.png"),
    Image.asset("images/de_5.png")
  ];

  final List<Image> _patioAssets = [
    Image.asset("images/p_2.png"),
    Image.asset("images/p_3.png"),
    Image.asset("images/p_4.png"),
    Image.asset("images/p_5.png"),
    Image.asset("images/p_6.png")
  ];

  final List<Image> _kanbanLifeAssets = [
    Image.asset("images/k_2.png"),
    Image.asset("images/k_3.png"),
    Image.asset("images/k_4.png"),
    Image.asset("images/k_5.png"),
    Image.asset("images/k_6.png"),
    Image.asset("images/k_7.png"),
  ];

  final List<Image> _perennialDawnAssets = [
    Image.asset("images/pd_2.png"),
    Image.asset("images/pd_3.png"),
    Image.asset("images/pd_4.png"),
    Image.asset("images/pd_5.png"),
    Image.asset("images/pd_6.png")
  ];

  final List<Image> _mepoAssets = [
    Image.asset("images/m_2.png"),
    Image.asset("images/m_3.png"),
    Image.asset("images/m_4.png"),
    Image.asset("images/m_5.png"),
    Image.asset("images/m_6.png"),
    Image.asset("images/m_7.png")
  ];

  final List<Image> _hostprayAssets = [
    Image.asset("images/hp_2.png"),
    Image.asset("images/hp_3.png"),
    Image.asset("images/hp_4.png"),
    Image.asset("images/hp_5.png"),
    Image.asset("images/hp_6.png")
  ];

  void precacheImages(List assets) {
    for (final asset in assets) {
      precacheImage(asset.image, context);
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    precacheImages(_dingleAssets);

    precacheImages(_bleepAssets);

    precacheImages(_hyphyAssets);

    precacheImages(_deftAssets);

    precacheImages(_patioAssets);

    precacheImages(_kanbanLifeAssets);

    precacheImages(_perennialDawnAssets);

    precacheImages(_hostprayAssets);

    precacheImages(_mepoAssets);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      PictureView(
        title: "Video Chat",
        description: "It's a new, fun way to learn new lanugages. Call your friends and study together!",
        child: SizedBox.shrink(),
        asset: "images/d_1.png",
        assets: _dingleAssets,
      ),
      PictureView(
        title: "Podcast Player",
        description: "It's a podcast player. Browse through the collections of informative podcasts that will surely change your life.",
        child: SizedBox.shrink(),
        asset: "images/b_1.png",
        assets: _bleepAssets,
      ),
      PictureView(
        title: "Video Player",
        description: "A video player. Discover your favorite shows and don't forget to subscribe to the channels that you find interesting!",
        child: SizedBox.shrink(),
        asset: "images/h_1.png",
        assets: _hyphyAssets,
      ),
      PictureView(
        title: "Bus Tracker",
        description: "It lets you see nearby buses and trams in real time. You can leave your home/office just in time for the departure.",
        child: SizedBox.shrink(),
        asset: "images/de_1.png",
        assets: _deftAssets,
      ),
      PictureView(
        title: "Food Delivery",
        description: "It's the food delivery app. The user can find venues that match his preferences to order a meal.",
        child: SizedBox.shrink(),
        asset: "images/p_1.png",
        assets: _patioAssets,
      ),
      PictureView(
          title: "Kanban Board",
          description: "It's an intuitive project and task management tool that helps you manage your work in a visual and pleasant way.",
          child: SizedBox.shrink(),
          asset: "images/k_1.png",
          assets: _kanbanLifeAssets
      ),
      PictureView(
          title: "Social Network",
          description:
          "It's an internet platform for people who want to have stronger connection with their neighborhood friends.",
          child: SizedBox.shrink(),
          asset: "images/pd_1.png",
          assets: _perennialDawnAssets),
      PictureView(
          title: "Dating App",
          description:
          "It's a social media platform for meeting new people at local events.",
          child: SizedBox.shrink(),
          asset: "images/m_1.png",
          assets: _mepoAssets),
      PictureView(
          title: "Prayer App",
          description:
          "It's a way for people to easily share their thoughts and prayers with other users.",
          child: SizedBox.shrink(),
          asset: "images/hp_1.png",
          assets: _hostprayAssets)
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DescriptionView(
        title: "Apps",
        description: "My most notable projects are listed below with additional information about their purpose.",
        child: !PlatformUtil().isDesktop(context) ? Column(children: children) : CustomColumnRowView(
            itemCount: 3,
            children: GridUtil().getGrid(context, children)),
      ),
    );
  }
}
