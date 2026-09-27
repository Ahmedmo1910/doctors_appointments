import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/login_request_body.dart';
import '../../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  void emitLoginState(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final result = await _loginRepo.login(loginRequestBody);

    result.when(
      success: (loginResponse) {
        emit(LoginState.success(loginResponse));
      },
      failure: (failure) {
        emit(LoginState.failure(error: failure.apiErrorModel.message ?? 'An unknown error occurred'));
      },
    );
  }
}
