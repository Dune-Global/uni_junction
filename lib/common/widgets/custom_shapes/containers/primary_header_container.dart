import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uni_junction/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:uni_junction/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:uni_junction/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatefulWidget {
  const TPrimaryHeaderContainer({
    Key? key,
    required this.child,
    this.height = 550,
    this.backgroundColor = TColors.primary,
    this.circleColor = TColors.darkerGrey,
  }) : super(key: key);

  final Widget child;
  final double? height;
  final Color? backgroundColor;
  final Color? circleColor;

  @override
  _TPrimaryHeaderContainerState createState() => _TPrimaryHeaderContainerState();
}

class _TPrimaryHeaderContainerState extends State<TPrimaryHeaderContainer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  final Random _random = Random();
  double randomTop1 = 0;
  double randomRight1 = 0;
  double randomTop2 = 0;
  double randomRight2 = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: true);

    _animation1 = Tween<double>(begin: -150, end: -100).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _animation2 = Tween<double>(begin: 350, end: 400).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed ||
          _controller.status == AnimationStatus.dismissed) {
        setState(() {
          randomTop1 = _random.nextDouble() * 50;
          randomRight1 = _random.nextDouble() * 50;
          randomTop2 = _random.nextDouble() * 50;
          randomRight2 = _random.nextDouble() * 50;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: SizedBox(
        height: widget.height,
        child: Container(
          color: widget.backgroundColor,
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: _animation1,
                builder: (context, child) {
                  return Positioned(
                    top: _animation1.value + randomTop1,
                    right: _animation1.value + randomRight1,
                    child: TCircularContainer(
                        backgroundColor: widget.circleColor!.withOpacity(0.1)),
                  );
                },
              ),
              AnimatedBuilder(
                animation: _animation2,
                builder: (context, child) {
                  return Positioned(
                    top: _animation2.value + randomTop2,
                    right: _animation2.value + randomRight2,
                    child: TCircularContainer(
                        backgroundColor: widget.circleColor!.withOpacity(0.04)),
                  );
                },
              ),
              widget.child,
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}