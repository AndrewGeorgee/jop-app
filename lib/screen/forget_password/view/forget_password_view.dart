import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:job_application/core/utils/assets.dart';

import '../../../core/state_renderer/stete_render_impl.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/get.dart';
import '../../../core/utils/size.dart';
import '../../../core/utils/styles.dart';
import '../../../core/widget/appbar_icon_widget.dart';
import '../../../core/widget/bottom_widget.dart';
import '../view_model/forget_viewmodel.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _phoneTextEditingController =
      TextEditingController();
  final ForgetViewModel _viewModel = instance<ForgetViewModel>();

  bind() {
    _viewModel.start();
    _emailTextEditingController.addListener(
        () => _viewModel.setEmail(_emailTextEditingController.text));

    _phoneTextEditingController.addListener(() {
      _viewModel.setPhone(_phoneTextEditingController.text);
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    bind();
  }

  late final TabController _tabController;
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
                    ?.getScreenWidget(context, _getScreenWidget(), () {}) ??
                _getScreenWidget();
          }),
    );
  }

  Widget _getScreenWidget() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeVertical! * 5,
          horizontal: SizeConfig.blockSizeVertical! * 2,
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Align(
            alignment: Alignment.topLeft,
            child: AppBarIconWidget(
              onTab: () {},
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 7,
          ),
          SvgPicture.asset(
            AssetManager.jobizzLogo,
            width: 28,
            height: 24,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 4,
          ),
          Text(
            'Forgot Password',
            textAlign: TextAlign.center,
            style: Styles.textStyles28,
          ),
          Text(
            'Enter your email or phone number, we will send you verification code',
            textAlign: TextAlign.center,
            style: Styles.textStyles15.copyWith(fontSize: AppSize.s16),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: HexColor('#F2F6FD'),
            ),
            child: TabBar.secondary(
              controller: _tabController,
              tabs: const <Widget>[
                Tab(text: 'E-mail'),
                Tab(text: 'Mobil Number'),
              ],
              labelColor: Colors.black,
              dividerColor: Colors.black,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 5,
              ),
              indicator: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              labelStyle: GoogleFonts.inter(
                  fontSize: 15,
                  color: Colors.black,
                  decorationStyle: TextDecorationStyle.dotted,
                  fontWeight: FontWeight.w900),
              // enableFeedback: false,
              // automaticIndicatorColorAdjustment: false,
              // physics: const BouncingScrollPhysics(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(children: [
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 6,
                  ),
                  TextFormField(
                    controller: _emailTextEditingController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                ColorManager.textFormFeildColor), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      hintText: 'E-mail',
                      prefixIcon: const Icon(Icons.email_outlined),
                      hintStyle: Styles.textStylesHintText,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: SizeConfig.screenWidth,
                    child: BottomWidgetWithBackgraundForForgetPassword(
                      text: 'Send code',
                      onTab: () {
                        _viewModel.forgetPAssword();
                      },
                    ),
                  ),
                ]),
                Column(children: [
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 6,
                  ),
                  Container(
                    width: double.infinity,
                    height: 61.5,
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorManager.grayColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(children: [
                      CountryCodePicker(
                        onChanged: (country) {
                          // update view model with code
                          // _viewModel.setCountryCode(
                          //     country.dialCode ?? Constant.token);
                        },
                        initialSelection: '+20',
                        favorite: const ['+39', 'FR', "+966"],
                        // optional. Shows only country name and flag
                        showCountryOnly: true,
                        hideMainText: true,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          width: 2.5,
                          height: SizeConfig.screenHeight,
                          color: ColorManager.grayColor.withOpacity(0.4),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          controller: _phoneTextEditingController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Phone Number'),
                        ),
                      ))
                    ]),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: SizeConfig.screenWidth,
                    child: BottomWidgetWithBackgraundForForgetPassword(
                      text: 'Send code',
                      onTab: () {
                        _viewModel.forgetPAsswordbyPhone();
                      },
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
