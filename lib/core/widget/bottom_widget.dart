import 'package:flutter/material.dart';
import 'package:job_application/core/utils/size2.dart';

import '../utils/colors.dart';
import '../utils/styles.dart';

class BottomWidgetWithBackgraund extends StatelessWidget {
  final double number;
  final String text;
  final VoidCallback onTab;
  const BottomWidgetWithBackgraund({
    super.key,
    required this.text,
    required this.onTab, required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(number)),
      child: SizedBox(
        height: 60,
        child: ElevatedButton(
          onPressed: onTab,
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(ColorManager.bottomColor2),
          ),
          child: Text(
            text,
            style: Styles.textStyles28.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class BottomWidgetWithBackgraundForForgetPassword extends StatelessWidget {
  final String text;
  final VoidCallback onTab;
  const BottomWidgetWithBackgraundForForgetPassword({
    super.key,
    required this.text,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        onPressed: onTab,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ColorManager.bottomColor2),
        ),
        child: Text(
          text,
          style:
              Styles.textStyles15.copyWith(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
