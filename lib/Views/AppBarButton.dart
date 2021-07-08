import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final Widget child;
  final Function onTap;

  AppBarButton({
    @required this.child,
    @required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
            height: 80,
            child: Center(child: child)),
      ),
    );
  }
}

