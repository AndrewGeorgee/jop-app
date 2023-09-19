import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_application/core/utils/size.dart';

import 'colors.dart';

abstract class Styles {
  static var textStyles28 = GoogleFonts.poppins(
    color: ColorManager.pColor,
    fontSize: AppSize.s28,
    fontWeight: FontWeight.w600,
  );
  static var textStyles15 = GoogleFonts.poppins(
    fontSize: AppSize.s20,
    color: ColorManager.grayColor,
    fontWeight: FontWeight.w400,
  );
  static var textStylesHintText = GoogleFonts.poppins(
    fontSize: AppSize.s20,
    color: ColorManager.grayColor,
    fontWeight: FontWeight.w600,
  );
}
