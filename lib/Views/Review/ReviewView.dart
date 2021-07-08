import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';
import 'package:michalkubizna/Views/Description/DescriptionView.dart';
import 'package:michalkubizna/Utils/GridUtil.dart';

class ReviewView extends StatelessWidget {
  ReviewView({ Key key}) : super(key: key);

  Widget _buildReview(BuildContext context, String text, String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            for (var i = 0; i < 5; i++) Icon(Icons.star, color: Colors.blue,)
          ],),
        ),
        Text(text,
            textAlign: TextAlign.center),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold)))
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Function child =
        (List<Widget> children) => PlatformUtil().isDesktop(context)
            ? CustomColumnRowView(
                children: GridUtil().getGrid(context, children), itemCount: 2)
            : Column(children: children);

    return Container(
        color: Colors.blue[50],
        padding: const EdgeInsets.all(16.0),
        child: DescriptionView(
            title: "Reviews",
            description: "Here's what my clients are saying.",
            child: child([
              _buildReview(context, "Another excellent round of cooperation with Michal. Looking forward to more.", "Petr - Kanban Tasker"),
              _buildReview(
                  context,
                  "Michal is an excellent developer with very fast turn-around while maintaining quality work. I am very satisfied with him and will hire him again.",
                  "Petr - Developer needed for kanban-style scheduling application"),
              _buildReview(
                  context,
                  "Michal went far above and beyond the requirements of the contract. "
                      "As a novice to coding myself, he walked me through understanding what my project required that I did not originally plan for. "
                      "Due to my inexperience, the project had a few unexpected challenges which delayed the timeline by a few days;"
                      " during this time, he worked tirelessly outside of his contractual obligations to troubleshoot and resolve the issues. "
                      "Michal is an excellent communicator, and was so easy to work with. I look forward to working with him again.",
                  "Kelly - Developer needed to create algorithm for matching users based on location"),
              _buildReview(
                  context,
                  "Michal did an excellent job rewriting my android app to flutter. He is fast and has good communication skills. I Highly recommend him for app development tasks.",
                  "Jeffrey - Remake android app in a hybrid way"),
              _buildReview(
                  context,
                  "Very good knowledge about react, scraping and flutter, already talked about doing the full project, will be hiring again.",
                  "Sara - Instagram Scraper Development in Flutter"),
              _buildReview(
                  context,
                  "Michal is highly talented even we had a big problem in creating our app our output was still fulfilled. I hope we can solve our futuristic problem.",
                  "Clyde - Custom Keyboard App using Flutter")
            ])));
  }
}
