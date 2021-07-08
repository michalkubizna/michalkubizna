import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SlideAnimationView extends StatefulWidget {
  final Widget child;
  final int milliseconds;
  final int i;
  final int length;
  final double durationFraction;

  SlideAnimationView({
    @required this.child,
    @required this.milliseconds,
    @required this.i,
    @required this.length,
    @required this.durationFraction
  });

  @override
  _SlideAnimationViewState createState() => _SlideAnimationViewState();
}

class _SlideAnimationViewState extends State<SlideAnimationView> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  Animation<double> _opacity;

  Animation<Offset> _offset;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: widget.milliseconds));

    final double addedValue = widget.i * (1 - widget.durationFraction) / (widget.length - 1);

    final double begin = 0.0 + addedValue;
    final double end =  widget.durationFraction + addedValue;

    _opacity = Tween(begin: 0.0, end: 1.0
    ).animate(CurvedAnimation(parent: _animationController, curve: Interval(begin, end, curve: Curves.ease)));

    _offset = Tween(begin: Offset(0, 1), end: Offset(0, 0)
    ).animate(CurvedAnimation(parent: _animationController, curve: Interval(begin, end, curve: Curves.ease)));

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
//    timeDilation = 5;

    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(position: _offset, child: widget.child,),
    );
  }
}
