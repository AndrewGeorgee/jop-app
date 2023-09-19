import 'package:flutter/material.dart';
import 'package:job_application/core/utils/colors.dart';
import 'package:job_application/core/utils/size.dart';
import 'package:job_application/core/utils/styles.dart';

class CustomBottomWidget extends StatelessWidget {
  final String text;
  final GestureTapCallback ontab;
  const CustomBottomWidget(
      {super.key, required this.text, required this.ontab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontab,
      child: Container(
        width: AppSize.s158,
        height: AppSize.s56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorManager.bottomColor,
        ),
        child: Center(
          child: Text(text,
              style: Styles.textStyles15.copyWith(color: Colors.white)),
        ),
      ),
    );
  }
}
