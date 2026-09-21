import 'package:doctors_appointments/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: TextStyles.font13darkPrimaryColorRegular,
          ),
          TextSpan(text: ' Sign Up', style: TextStyles.font13BlueSemiBold),
        ],
      ),
    );
  }
}
