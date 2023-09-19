import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/size.dart';
import '../../../core/utils/styles.dart';
import '../../../domain/models/models.dart';

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            height: SizeConfig.blockSizeVertical! * 35,
            child: SvgPicture.asset(
              _sliderObject.image,
              fit: BoxFit.cover,
            )),
        Text(
          _sliderObject.title,
          textAlign: TextAlign.center,
          style: Styles.textStyles28,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Styles.textStyles15,
          ),
        ),
      ],
    );
  }
}
