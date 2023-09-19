import 'package:flutter/material.dart';
import 'package:job_application/core/utils/nav.dart';
import 'package:job_application/screen/getstart/get_start_view.dart';
import 'package:job_application/screen/onboarding/view/onboarding_viewmodel.dart';

import '../../../core/utils/styles.dart';
import '../../../core/widget/custom_bottom_widget.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    super.key,
    required PageController pageController,
    required OnBoardingViewModel viewModel,
  })  : _pageController = pageController,
        _viewModel = viewModel;

  final PageController _pageController;
  final OnBoardingViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {
                Go(context).push(page: const GetStartView());
              },
              child: Text(
                'Skip',
                style: Styles.textStyles15,
              )),
          CustomBottomWidget(
            text: 'Next',
            ontab: () {
              _pageController.animateToPage(_viewModel.goNext(),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceInOut);
            },
          )
        ],
      ),
    );
  }
}
