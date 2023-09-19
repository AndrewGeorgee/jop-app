import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_application/screen/login/view/login_view.dart';
import 'package:job_application/screen/register/view/register_view.dart';

import '../../core/utils/assets.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/get.dart';
import '../../core/utils/nav.dart';
import '../../core/utils/size.dart';
import '../../core/utils/size2.dart';
import '../../core/widget/bottom_widget.dart';

class GetStartView extends StatelessWidget {
  const GetStartView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig2().init(context);
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  width: SizeConfig.screenWidth,
                  height: getProportionateScreenHeight(200),
                  decoration: BoxDecoration(
                      color: ColorManager.circleColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(300),
                        bottomRight: Radius.circular(300),
                      ))),
            ),
            SizedBox(
                height: SizeConfig.blockSizeVertical! * 35,
                child: SvgPicture.asset(AssetManager.getStart)),
            SizedBox(height: SizeConfig.blockSizeVertical! * 5),
            BottomWidgetWithBackgraund(
              number: 20,
              text: 'Login',
              onTab: () {
                initLoginModule();
                Go(context).push(page: const LoginView());
              },
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 5),
            BottomWidgetWithBackgraund(
              number: 20,
              text: 'Register',
              onTab: () {
                initRegisterModule();
                Go(context).push(page: const RegisterView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
