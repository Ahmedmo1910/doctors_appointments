import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctors_appointments/core/theme/text_styles.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';

class DoctorsContainer extends StatelessWidget {
  const DoctorsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 165.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              image: const DecorationImage(
                image: AssetImage('assets/images/home_container_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Book and\nschedule with\nnearest doctor",
                  style: TextStyles.font18WhiteMedium,
                ),
                verticalSpace(16),
                Expanded(
                  child: CustomButton(
                    horizontalPadding: 12.w,
                    verticalPadding: 6.h,
                    borderRadius: 48.0,
                    buttonHeight: 38.h,
                    buttonWidth: 109.w,
                    buttonText: "Find Nearby",
                    backgroundColor: Colors.white,
                    textStyle: TextStyles.font12BlueRegular.copyWith(
                      color: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      // Handle button press
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 16,
            child: Image.asset(
              'assets/images/nurse.png',
              height: 200.h,
            ),
          ),
        ],
      ),
    );
  }
}
