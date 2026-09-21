import 'package:doctors_appointments/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctors_appointments/core/helpers/spacing.dart';
import 'package:doctors_appointments/core/theme/text_styles.dart';
import 'package:doctors_appointments/core/widgets/custom_text_form_field.dart';

import 'widgets/dont_have_account_text.dart';
import 'widgets/terms_and_conditions_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back', style: TextStyles.font24BlueBold),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14greyRegular,
                ),
                verticalSpace(36),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(hintText: 'Email'),
                      verticalSpace(18),
                      CustomTextFormField(
                        hintText: 'Password',
                        isObscureText: _isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isObscureText = !_isObscureText;
                            });
                          },
                          child: Icon(
                            _isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      verticalSpace(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyles.font13blueRegular,
                        ),
                      ),
                      verticalSpace(40),
                      CustomButton(
                        buttonText: 'Login',
                        textStyle: TextStyles.font16whiteSemiBold,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Perform login action
                          }
                        },
                      ),
                      verticalSpace(16),
                      const TermsAndConditionsText(),
                      verticalSpace(60),
                      const DontHaveAccountText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
