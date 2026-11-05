import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/home_repo.dart';
import '../../../../core/networking/api_result.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeState.initial());

  Future<void> getSpecialization() async {
    emit(HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecialization();
    response.when(
      success: (data) {
        emit(
          HomeState.specializationsLoaded(specializationsResponseModel: data),
        );
      },
      failure: (error) {
        emit(
          HomeState.specializationsError(
            error: error.apiErrorModel.message ?? 'An unknown error occurred',
          ),
        );
      },
    );
  }
}
