import 'package:flutter/material.dart';
import 'package:doctors_appointments/core/theme/app_colors.dart';
import 'package:doctors_appointments/core/theme/text_styles.dart';

class MainButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final bool hasCircularBorder;
  final Widget? child;

  MainButton({
    super.key,
    this.text,
    this.onTap,
    this.hasCircularBorder = false,
    this.child,
  }) {
    assert(text != null || child != null);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          shape: hasCircularBorder
              ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))
              : null,
        ),
        child: text != null
            ? Text(text!, style: TextStyles.font16whiteW600)
            : child,
      ),
    );
  }
}
