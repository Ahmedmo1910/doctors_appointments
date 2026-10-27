import 'package:doctors_appointments/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class HomeInfoRow extends StatelessWidget {
  final String title;
  const HomeInfoRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextStyles.font18darkPrimaryColorSemiBold),
        const Spacer(),
        Text("See All", style: TextStyles.font12BlueRegular),
      ],
    );
  }
}
