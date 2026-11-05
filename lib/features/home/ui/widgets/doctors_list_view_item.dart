import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctors_appointments/core/helpers/spacing.dart';
import 'package:doctors_appointments/core/theme/text_styles.dart';

import '../../data/models/specialization_response_model.dart';

class DoctorsListViewItem extends StatelessWidget {
  final int itemIndex;
  final Doctors? doctorData;
  const DoctorsListViewItem({
    super.key,
    required this.itemIndex,
    required this.doctorData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            // spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              width: 120.w,
              height: 120.h,
              fit: BoxFit.cover,
              'https://via.placeholder.com/150',
            ), // Placeholder image
          ),
          horizontalSpace(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                doctorData?.name ?? 'Dr. Name',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(6),
              Text(
                '${doctorData?.degree} | ${doctorData?.phone}',
                style: TextStyles.font12GreyRegular,
              ),
              verticalSpace(6),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 16),
                  horizontalSpace(4),
                  Text(
                    '4.5  (4,279 reviews)',
                    style: TextStyles.font12GreyRegular,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
