import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/text_styles.dart';

class DoctorSpecialtyListView extends StatelessWidget {
  const DoctorSpecialtyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35.r,
                  backgroundColor: Color(0xFFF4F8FF),
                  child: Icon(
                    Icons.medical_services,
                    size: 30.sp,
                    color: Colors.blue,
                  ),
                ),
                verticalSpace(8),
                Text(
                  'Specialty ${index + 1}',
                  style: TextStyles.font12darkPrimaryColorRegular,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
