import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctors_appointments/core/networking/api_result.dart';

import '../../data/models/signup_request_body.dart';
import '../../data/repos/signup_repo.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitSignupState() async {
    emit(const SignupState.loading());
    final response = await _signupRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        gender: 0,
      ),
    );
    response.when(
      success: (signupResponse) {
        emit(SignupState.success(signupResponse));
      },
      failure: (failure) {
        emit(
          SignupState.failure(
            error: failure.apiErrorModel.message ?? 'An unknown error occurred',
          ),
        );
      },
    );
  }
}
