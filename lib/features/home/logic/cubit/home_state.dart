import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/specialization_response_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.specializationsLoading() = SpecializationsLoading;

  const factory HomeState.specializationsLoaded({
    required SpecializationResponseModel specializationsResponseModel,
  }) = SpecializationsLoaded;

  const factory HomeState.specializationsError({required String error}) =
      SpecializationsError;
}
