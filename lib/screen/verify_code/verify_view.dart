import 'package:flutter/material.dart';
import 'package:job_application/screen/verify_code/verify_view_model.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../core/state_renderer/stete_render_impl.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/get.dart';
import '../../core/utils/size.dart';
import '../../core/utils/styles.dart';
import '../../core/widget/appbar_icon_widget.dart';
import '../../core/widget/bottom_widget.dart';

class VerifyCodeForForgetPAssword extends StatefulWidget {
  const VerifyCodeForForgetPAssword({super.key});

  @override
  State<VerifyCodeForForgetPAssword> createState() =>
      _VerifyCodeForForgetPAsswordState();
}

class _VerifyCodeForForgetPAsswordState
    extends State<VerifyCodeForForgetPAssword> {
  final VerifyViewModel _viewModel = instance<VerifyViewModel>();

  final TextEditingController _codeController = TextEditingController();
  _bind() {
    _viewModel.start();
    _codeController.addListener(() => _viewModel.setCode(_codeController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: ColorManager.white,
        body: StreamBuilder<FlowState>(
            stream: _viewModel.outputState,
            builder: (context, snapshot) {
              return snapshot.data?.getScreenWidget(context, getContaint(), () {
                    _viewModel.verify();
                  }) ??
                  getContaint();
            }));
  }

  Widget getContaint() {
    return SingleChildScrollView(
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
                onTab: () {
                  _viewModel.verify();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPinCodeFields(BuildContext context) {
    return PinCodeTextField(
      controller: _codeController,
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
