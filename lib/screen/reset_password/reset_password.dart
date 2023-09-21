import 'package:flutter/material.dart';
import 'package:job_application/core/utils/assets.dart';

import '../../core/utils/colors.dart';
import '../../core/utils/size.dart';
import '../../core/utils/styles.dart';
import '../../core/widget/appbar_icon_widget.dart';
import '../../core/widget/bottom_widget.dart';

class ResetPasswordview extends StatelessWidget {
  const ResetPasswordview({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeVertical! * 5,
          horizontal: SizeConfig.blockSizeVertical! * 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: AppBarIconWidget(
                onTab: () {},
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 7,
            ),
            logo,
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 4,
            ),
            Text(
              'Reset Password',
              textAlign: TextAlign.center,
              style: Styles.textStyles28,
            ),
            Text(
              'Enter your new password and confirm the new password to reset password',
              textAlign: TextAlign.center,
              style: Styles.textStyles15.copyWith(fontSize: AppSize.s16),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1.5,
                      color: ColorManager.textFormFeildColor), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(13.0),
                ),
                hintText: 'Password',
                prefixIcon: const Icon(Icons.password_sharp),
                suffixIcon: const Icon(Icons.remove_red_eye),
                hintStyle: Styles.textStylesHintText,
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1.5,
                      color: ColorManager.textFormFeildColor), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(13.0),
                ),
                hintText: 'Confirm Password',
                prefixIcon: const Icon(Icons.password_sharp),
                suffixIcon: const Icon(Icons.remove_red_eye),
                hintStyle: Styles.textStylesHintText,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: SizeConfig.screenWidth,
              child: BottomWidgetWithBackgraundForForgetPassword(
                text: 'Reset Password',
                onTab: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
