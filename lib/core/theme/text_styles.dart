import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class TextStyles {
  static TextStyle font24BlackW700 = TextStyle(
    fontSize: 24.sp,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );

  static TextStyle font32BlueW900 = TextStyle(
    fontSize: 32.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w900,
  );

  static TextStyle font13greyW400 = TextStyle(
    fontSize: 13.sp,
    color: AppColors.gray,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font16whiteW600 = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
}
