import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctors_appointments/core/helpers/spacing.dart';
import 'package:doctors_appointments/core/theme/text_styles.dart';

import '../../data/models/specialization_response_model.dart';

class DoctorSpecialtyListViewItem extends StatelessWidget {
  final SpecializationData specializationData;
  final int itemIndex;
  const DoctorSpecialtyListViewItem({
    super.key,
    required this.itemIndex,
    required this.specializationData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
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
            specializationData.name ?? 'General',
            style: TextStyles.font12darkPrimaryColorRegular,
          ),
        ],
      ),
    );
  }
}
