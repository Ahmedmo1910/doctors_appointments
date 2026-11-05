import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../logic/cubit/home_cubit.dart';
import '../../logic/cubit/home_state.dart';
import 'doctor_specialty_list_view.dart';
import 'doctors_list_view.dart';
import 'home_info_row.dart';

class SpecializationsAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationsAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsLoaded ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: () => setUpLoading(),
          specializationsLoaded: (specializationsResponseModel) {
            final specializationsDataList =
                specializationsResponseModel.specializationDataList;
            return Expanded(
              child: Column(
                children: [
                  DoctorSpecialtyListView(
                    specializationsDataList: specializationsDataList ?? [],
                  ),
                  verticalSpace(16),
                  HomeInfoRow(title: "Recommended Doctors"),
                  verticalSpace(16),
                  DoctorsListView(
                    doctorsList: specializationsDataList?[0].doctorsList,
                  ),
                ],
              ),
            );
          },
          specializationsError: (error) => setUpError(error),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setUpLoading() => const Center(child: CircularProgressIndicator());
  Widget setUpError(String error) => Center(child: Text(error));
}
