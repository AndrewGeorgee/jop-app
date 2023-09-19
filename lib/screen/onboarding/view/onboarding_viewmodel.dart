import 'dart:async';

import 'package:job_application/core/utils/base_view_model.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/text.dart';
import '../../../domain/models/models.dart';



class OnBoardingViewModel extends BaseViewModel
    implements OnBoardingViewModelInputs, OnBoardingViewModelOutput {
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);
  void _postDataToView() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(
          AppStrings.onboardingTitle1,
          AppStrings.onboardingSubTitle1,
          AssetManager.onbarding1,
        ),
        SliderObject(
          AppStrings.onboardingTitle2,
          AppStrings.onboardingSubTitle2,
          AssetManager.onbarding2,
        ),
        SliderObject(
          AppStrings.onboardingTitle3,
          AppStrings.onboardingSubTitle3,
          AssetManager.onbarding3,
        ),
        SliderObject(
          AppStrings.onboardingTitle4,
          AppStrings.onboardingSubTitle4,
          AssetManager.onbarding4,
        ),
      ];
}

abstract class OnBoardingViewModelInputs {
  int goNext();
  void onPageChanged(int index);
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutput {
  Stream<SliderViewObject> get outputSliderViewObject;
}
