import 'dart:math';
import 'package:flutter/material.dart';

class FlipperAnimation extends StatefulWidget {
  final Widget frontWidget;
  final Widget backWidget;
  const FlipperAnimation(
      {Key? key, required this.frontWidget, required this.backWidget})
      : super(key: key);

  @override
  State<FlipperAnimation> createState() => _FlipperAnimationState();
}

class _FlipperAnimationState extends State<FlipperAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation filpperAnimation;
  Offset center = Offset(0, 0);
  GlobalKey _key = GlobalKey();
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    filpperAnimation =
        CurveTween(curve: Curves.ease).animate(animationController);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setCenter();
    });
    super.initState();
  }

  setCenter() {
    RenderBox box = _key.currentContext!.findRenderObject() as RenderBox;
    Size size = box.size;
    center = Offset(size.width / 2, size.height / 2);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: filpperAnimation,
        builder: ((context, child) {
          return filpperAnimation.value < 0.5
              ? Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(
                      pi * filpperAnimation.value,
                    ),
                  origin: center,
                  child: InkWell(
                      onTap: () {
                        animationController.forward();
                      },
                      child: SizedBox(key: _key, child: widget.frontWidget)))
              : Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(
                      pi * filpperAnimation.value * (-1),
                    ),
                  origin: center,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(pi * (-1)),
                    origin: center,
                    child: InkWell(
                        onTap: () {
                          animationController.reverse();
                        },
                        child: SizedBox(
                          key: _key,
                          child: widget.backWidget,
                        )),
                  ));
        }));
  }
}
