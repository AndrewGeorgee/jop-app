import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/size.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.blockSizeHorizontal! * 50,
          decoration: BoxDecoration(
              color: ColorManager.circleColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(300),
                bottomRight: Radius.circular(300),
              ))),
    );
  }
}