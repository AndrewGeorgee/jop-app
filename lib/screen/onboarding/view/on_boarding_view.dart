import 'package:flutter/material.dart';
import 'package:job_application/domain/models/models.dart';
import 'package:job_application/screen/onboarding/widget/bottom_widget.dart';
import 'package:job_application/screen/onboarding/widget/onboarding_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/utils/size.dart';
import '../widget/circle_widget.dart';
import 'onboarding_viewmodel.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();
  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return StreamBuilder<SliderViewObject>(
        stream: _viewModel.outputSliderViewObject,
        builder: (context, snapshot) {
          return _getContentWidget(snapshot.data);
        });
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const CircleWidget(),
          Expanded(
            child: PageView.builder(
                controller: _pageController,
                itemCount: sliderViewObject.numOfSlides,
                onPageChanged: (index) {
                  _viewModel.onPageChanged(index);
                },
                itemBuilder: (context, index) {
                  return OnBoardingPage(sliderViewObject.sliderObject);
                }),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SmoothPageIndicator(
              controller: _pageController, // PageController
              count: sliderViewObject.numOfSlides,

              effect: const ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
              ), // your preferred effect
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 3,
          ),
          BottomWidget(pageController: _pageController, viewModel: _viewModel),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 3,
          ),
        ]),
      );
    }
  }
}
