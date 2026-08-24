import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctors_appointments/core/theme/text_styles.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/svgs/logo.svg', width: 50.w, height: 50.h),
        SizedBox(width: 10.w),
        Text('Docdoc', style: TextStyles.font24BlackW700),
      ],
    );
  }
}
