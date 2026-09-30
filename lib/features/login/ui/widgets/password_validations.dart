import 'package:flutter/material.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasNumber;
  final bool hasUppercase;
  final bool hasLowercase;
  final bool hasSpecialCharacter;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.hasNumber,
    required this.hasUppercase,
    required this.hasLowercase,
    required this.hasSpecialCharacter,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildValidationRow('At least 1 number', hasNumber),
        verticalSpace(2),
        _buildValidationRow('At least 1 lowercase letter', hasLowercase),
        verticalSpace(2),
        _buildValidationRow('At least 1 uppercase letter', hasUppercase),
        verticalSpace(2),
        _buildValidationRow(
          'At least 1 special character',
          hasSpecialCharacter,
        ),
        verticalSpace(2),
        _buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }
}

Widget _buildValidationRow(String text, bool isValid) {
  return Row(
    children: [
      CircleAvatar(radius: 2.5, backgroundColor: AppColors.grey),
      horizontalSpace(6),
      Text(
        text,
        style: TextStyles.font13darkPrimaryColorRegular.copyWith(
          decoration: isValid
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          decorationColor: Colors.green,
          decorationThickness: 2,
          color: isValid ? AppColors.grey : AppColors.darkPrimaryColor,
        ),
      ),
    ],
  );
}
