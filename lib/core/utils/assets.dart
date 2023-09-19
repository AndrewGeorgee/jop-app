import 'package:flutter_svg/svg.dart';

const String jsonPath = "assets/json";

class AssetManager {
  static const logoPhoto = 'assets/logo/logo_photo.png';
  static const logoText = 'assets/logo/logo_text.png';
  static const onbarding1 = 'assets/onboarding/onbarding1.svg';
  static const onbarding2 = 'assets/onboarding/onbarding2.svg';
  static const onbarding3 = 'assets/onboarding/onbarding3.svg';
  static const onbarding4 = 'assets/onboarding/onbarding4.svg';
  static const getStart = 'assets/get_start/get_start.svg';
  static const jobizzLogo = 'assets/login/Jôbizz.svg';
}

class JsonAssets {
  static const String loading = "$jsonPath/loading.json";
  static const String error = "$jsonPath/error.json";
  static const String empty = "$jsonPath/empty.json";
  static const String success = "$jsonPath/success.json";
}

SvgPicture logo = SvgPicture.asset(
  AssetManager.jobizzLogo,
  width: 28,
  height: 24,
);
