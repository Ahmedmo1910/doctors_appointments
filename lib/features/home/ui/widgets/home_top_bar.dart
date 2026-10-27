import 'package:flutter/material.dart';
import 'package:doctors_appointments/core/theme/text_styles.dart';
import 'package:doctors_appointments/core/theme/app_colors.dart';
import 'package:flutter_svg/svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi Ahmed,", style: TextStyles.font18darkPrimaryColorBold),
            Text("How are you Today?", style: TextStyles.font12GreyRegular),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24.0,
          backgroundColor: AppColors.extraLighterGrey,
          child: SvgPicture.asset('assets/svgs/notifications.svg'),
        ),
      ],
    );
  }
}
