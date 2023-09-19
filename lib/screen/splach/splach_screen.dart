import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:job_application/screen/splach/widget/logo_animated.dart';

import '../../core/utils/assets.dart';
import '../../core/utils/nav.dart';
import '../../core/utils/size.dart';
import '../onboarding/view/on_boarding_view.dart';

class SplachView extends StatefulWidget {
  const SplachView({super.key});

  @override
  State<SplachView> createState() => _SplachViewState();
}

class _SplachViewState extends State<SplachView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> slidingAnimation;
  Timer? timer;
  startDelay() {
    timer = Timer(const Duration(seconds: 3), goNext);
  }

  goNext() {
    Go(context).push(page: const OnBoardingView());
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(_animationController);
    _animationController.forward();
    startDelay();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();

    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          HexColor('#356899'),
          HexColor('#264A6D'),
          HexColor('#21405F'),
          HexColor('#1A334C'),
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 10,
                child: Image.asset(
                  AssetManager.logoPhoto,
                ),
              ),
              LogoTextAnimated(slidingAnimation: slidingAnimation),
            ]),
      ),
    );
  }
}
