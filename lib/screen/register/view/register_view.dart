// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_application/screen/register/view/register_view_model.dart';

import '../../../core/state_renderer/stete_render_impl.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/get.dart';
import '../../../core/utils/nav.dart';
import '../../../core/utils/size.dart';
import '../../../core/utils/styles.dart';
import '../../../core/widget/appbar_icon_widget.dart';
import '../../../core/widget/bottom_widget.dart';
import '../../../core/widget/circle_logo.dart';
import '../../login/view/login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewModel _viewModel = instance<RegisterViewModel>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();
  final TextEditingController _userConfirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  _bind() {
    _viewModel.start();
    _userNameController
        .addListener(() => _viewModel.setUserName(_userNameController.text));
    _userPasswordController.addListener(
        () => _viewModel.setPassword(_userPasswordController.text));
    _emailController.addListener(() {
      _viewModel.setEmail(_emailController.text);
    });
    _userConfirmPasswordController.addListener(() {
      _viewModel.setCnfirmPassword(_userConfirmPasswordController.text);
    });
    // _viewModel.isUserLoggedInSuccessfullyStreamController.stream
    //     .listen((isLoaded) {
    //   if (isLoaded) {
    //     SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    //       _appPreferences.setUserLadiedIn();
    //       Go(context).push(page: const OnBoardingView());
    //     });
    //   }
    // });
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
        body: StreamBuilder<FlowState>(
            stream: _viewModel.outputState,
            builder: (context, snapshot) {
              return snapshot.data
                      ?.getScreenWidget(context, _getContentWidget(), () {
                    _viewModel.register();
                  }) ??
                  _getContentWidget();
            }));
  }

  Widget _getContentWidget() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarIconWidget(
              onTab: () {},
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            SvgPicture.asset(
              AssetManager.jobizzLogo,
              width: 28,
              height: 24,
            ),
            Text(
              'Registration 👍',
              style: Styles.textStyles28,
            ),
            Text(
              'Let’s Register. Apply to jobs!',
              style: Styles.textStyles15.copyWith(fontSize: AppSize.s16),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3.5,
            ),
            TextFormField(
              controller: _userNameController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1.5,
                      color: ColorManager.textFormFeildColor), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(13.0),
                ),
                hintText: 'Full Name',
                prefixIcon: const Icon(Icons.person_3_outlined),
                hintStyle: Styles.textStylesHintText,
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1.5,
                      color: ColorManager.textFormFeildColor), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(13.0),
                ),
                hintText: 'E-mail',
                prefixIcon: const Icon(Icons.email_outlined),
                hintStyle: Styles.textStylesHintText,
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            TextFormField(
              controller: _userPasswordController,
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
              controller: _userConfirmPasswordController,
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
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3.5,
            ),
            SizedBox(
              width: SizeConfig.screenWidth,
              child: BottomWidgetWithBackgraund(
                text: 'Register',
                onTab: () {
                  _viewModel.register();
                },
                number: 20,
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
            Row(children: [
              Expanded(
                child: Container(
                  height: 2,
                  color: ColorManager.grayColor,
                ),
              ),
              Text(
                '  Or continue with  ',
                style: Styles.textStyles15.copyWith(fontSize: AppMargin.m16),
              ),
              Expanded(
                child: Container(
                  height: 2,
                  color: ColorManager.grayColor,
                ),
              ),
            ]),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleLogo(logo: 'assets/login/cib_apple.svg'),
                CircleLogo(logo: 'assets/login/flat-color-icons_google.svg'),
                CircleLogo(logo: 'assets/login/ion_logo-facebook.svg'),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 1,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Go(context).push(page: const LoginView());
                },
                child: RichText(
                  text: TextSpan(
                    text: "Haven't an account?",
                    style: Styles.textStyles15.copyWith(fontSize: 10),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Register',
                        style: Styles.textStyles15.copyWith(
                            color: ColorManager.bottomColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
