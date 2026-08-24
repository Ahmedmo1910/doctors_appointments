import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/svgs/doctor.svg',
          width: 200.w,
          height: 200.h,
        ),
      ],
    );
  }
}
