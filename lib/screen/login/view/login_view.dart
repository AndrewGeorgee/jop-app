import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_application/core/state_renderer/stete_render_impl.dart';
import 'package:job_application/core/utils/colors.dart';
import 'package:job_application/core/utils/styles.dart';
import 'package:job_application/screen/forget_password/view/forget_password_view.dart';
import 'package:job_application/screen/register/view/register_view.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/get.dart';
import '../../../core/utils/nav.dart';
import '../../../core/utils/size.dart';
import '../../../core/widget/bottom_widget.dart';
import '../../../core/widget/circle_logo.dart';
import 'login_viewModel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  _bind() {
    _viewModel.start();
    _userNameController
        .addListener(() => _viewModel.setUserName(_userNameController.text));
    _userPasswordController.addListener(
        () => _viewModel.setPassword(_userPasswordController.text));
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
        appBar: AppBar(),
        body: StreamBuilder<FlowState>(
            stream: _viewModel.outputState,
            builder: (context, snapshot) {
              return snapshot.data
                      ?.getScreenWidget(context, _getContentWidget(), () {
                    _viewModel.login();
                  }) ??
                  _getContentWidget();
            }));
  }

  Widget _getContentWidget() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AssetManager.jobizzLogo,
                  width: 28,
                  height: 24,
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 2,
                ),
                Text(
                  'Welcome Back 👋',
                  style: Styles.textStyles28,
                ),
                Text(
                  'Let’s log in. Apply to jobs!',
                  style: Styles.textStyles15.copyWith(fontSize: AppSize.s16),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 7,
                ),
                StreamBuilder<bool>(
                    stream: _viewModel.outIsUserNameValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        controller: _userNameController,
                        decoration: const InputDecoration(
                          hintText: 'E-mail',
                          prefixIcon: Icon(Icons.email_outlined),
                          // hintStyle: Styles.textStylesHintText,
                        ),
                      );
                    }),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 3,
                ),
                StreamBuilder<bool>(
                    stream: _viewModel.outIsPasswordValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        controller: _userPasswordController,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.password_sharp),
                          suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                      );
                    }),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 7,
                ),
                SizedBox(
                  width: SizeConfig.screenWidth,
                  child: BottomWidgetWithBackgraund(
                    text: 'Login',
                    onTab: () {
                      _viewModel.login();
                    },
                    number: 20,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 3,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: TextButton(
                      onPressed: () {
                        initForgetPasswordModule();
                        Go(context).push(page: const ForgetPasswordView());
                      },
                      child: Text(
                        'Forget Password?',
                        style: Styles.textStyles28.copyWith(
                            color: ColorManager.bottomColor,
                            fontSize: AppPadding.p20,
                            fontWeight: FontWeight.w400),
                      )),
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
                    style:
                        Styles.textStyles15.copyWith(fontSize: AppMargin.m16),
                  ),
                  Expanded(
                    child: Container(
                      height: 2,
                      color: ColorManager.grayColor,
                    ),
                  ),
                ]),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 1.5,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleLogo(logo: 'assets/login/cib_apple.svg'),
                    CircleLogo(
                        logo: 'assets/login/flat-color-icons_google.svg'),
                    CircleLogo(logo: 'assets/login/ion_logo-facebook.svg'),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 1.5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Go(context).push(page: const RegisterView());
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Haven't an account?",
                        style: Styles.textStyles15.copyWith(fontSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Register',
                            style: Styles.textStyles15.copyWith(
                                color: ColorManager.bottomColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
