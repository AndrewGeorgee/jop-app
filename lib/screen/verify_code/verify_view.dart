import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../core/utils/assets.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/size.dart';
import '../../core/utils/styles.dart';
import '../../core/widget/appbar_icon_widget.dart';
import '../../core/widget/bottom_widget.dart';

class VerifyCodeForForgetPAssword extends StatelessWidget {
  const VerifyCodeForForgetPAssword({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SingleChildScrollView(
        child: Padding(
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
                'Verify Code',
                textAlign: TextAlign.center,
                style: Styles.textStyles28,
              ),
              Text(
                'Enter your verification code from your email or phone number that we’ve sent',
                textAlign: TextAlign.center,
                style: Styles.textStyles15.copyWith(fontSize: AppSize.s16),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 10,
              ),
              _buildPinCodeFields(context),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 5,
              ),
              SizedBox(
                width: SizeConfig.screenWidth,
                child: BottomWidgetWithBackgraundForForgetPassword(
                  text: 'Verify',
                  onTab: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPinCodeFields(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      autoFocus: false,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,
        activeColor: ColorManager.pColor,
        inactiveColor: Colors.grey,
        inactiveFillColor: Colors.white,
        activeFillColor: Colors.white,
        selectedColor: ColorManager.pColor,
        selectedFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: (submitedCode) {
        // otpCode = submitedCode;
        print("Completed");
      },
      onChanged: (value) {
        // ignore: avoid_print
        print(value);
      },
    );
  }
}
