import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/assets.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/size.dart';
import '../../core/utils/styles.dart';
import '../../core/widget/appbar_icon_widget.dart';
import '../../core/widget/bottom_widget.dart';

class ResetPasswordConfirmation extends StatelessWidget {
  const ResetPasswordConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorManager.white,
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
              height: SizeConfig.blockSizeVertical! * 4.5,
            ),
            logo,
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 7,
            ),
            SvgPicture.asset(
              'assets/get_start/confirmation.svg',
              height: 250,
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 4.5,
            ),
            Text(
              'Confirmation',
              textAlign: TextAlign.center,
              style: Styles.textStyles28,
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2.5,
            ),
            Text(
              'Your password has been changed. Please log in with your new password.',
              textAlign: TextAlign.center,
              style: Styles.textStyles15.copyWith(fontSize: AppSize.s16),
            ),
            const Spacer(),
            SizedBox(
              width: SizeConfig.screenWidth,
              child: BottomWidgetWithBackgraundForForgetPassword(
                text: 'Log in',
                onTab: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
