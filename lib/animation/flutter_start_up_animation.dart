import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StartUpAnimation extends StatefulWidget {
  final int crossAxisCount;
  final List<Widget> children;
  final int animationDuration;
  const StartUpAnimation(
      {Key? key,
      required this.crossAxisCount,
      required this.children,
      required this.animationDuration})
      : super(key: key);

  @override
  State<StartUpAnimation> createState() => _StartUpAnimationState();
}

class _StartUpAnimationState extends State<StartUpAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  List<Animation<double>> animations = [];
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: widget.animationDuration,
      ),
    );
    double wait = 1 / widget.children.length;
    double start = 0.0;
    double end = wait;
    for (int i = 0; i < widget.children.length; i++) {
      Animation<double> animation = CurveTween(
        curve: Interval(
          start,
          end,
          curve: Curves.ease,
        ),
      ).animate(animationController);
      animations.add(animation);
      start += wait;
      end += wait;
    }
    animationController.forward();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: widget.crossAxisCount,
      children: widget.children.map((child) {
        int index = widget.children.indexWhere(
          (element) => element == child,
        );
        return ScaleTransition(
          scale: animations[index],
          child: child,
        );
      }).toList(),
    );
  }
}
