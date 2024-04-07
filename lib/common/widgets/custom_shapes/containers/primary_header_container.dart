import 'package:flutter/material.dart';
import 'package:uni_junction/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:uni_junction/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:uni_junction/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: SizedBox(
        height: 550,
        child: Container(
          color: TColors.primary.withOpacity(1),
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(
                    backgroundColor: TColors.darkerGrey.withOpacity(0.1)),
              ),
              Positioned(
                top: 100,
                right: 350,
                child: TCircularContainer(
                    backgroundColor: TColors.darkerGrey.withOpacity(0.04)),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
