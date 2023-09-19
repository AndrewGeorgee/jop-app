

import 'package:flutter/material.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/size.dart';

class LogoTextAnimated extends StatelessWidget {
  const LogoTextAnimated({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: SizedBox(
            height: SizeConfig.blockSizeVertical! * 10,
            child: Image.asset(
              AssetManager.logoText,
            ),
          ),
        );
      },
    );
  }
}
