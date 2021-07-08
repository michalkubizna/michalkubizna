import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:michalkubizna/MyColors.dart';
import 'package:michalkubizna/Views/MouserRegionView.dart';

class EstimateProjectButton extends StatefulWidget {
  final String text;

  EstimateProjectButton({
    this.text = "Estimate a project",
  });

  @override
  _EstimateProjectButtonState createState() => _EstimateProjectButtonState();
}

class _EstimateProjectButtonState extends State<EstimateProjectButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: MouseRegionView(
        buildChild: (isHovered) => Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: MyColors.pink,
                foregroundDecoration: BoxDecoration(
                  color: isHovered ? Colors.black12 : Colors.transparent
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
              child: Text(widget.text,
                style:
                Theme.of(context).textTheme.headline1.copyWith(color: Colors.white), textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    );
  }
}
