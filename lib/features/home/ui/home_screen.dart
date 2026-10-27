import 'package:flutter/material.dart';
import 'widgets/doctors_list_view.dart';
import 'widgets/home_top_bar.dart';
import 'widgets/home_info_row.dart';
import 'widgets/doctors_container.dart';
import 'widgets/doctor_specialty_list_view.dart';

import '../../../core/helpers/spacing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 28.0),
          child: Column(
            children: [
              const HomeTopBar(),
              DoctorsContainer(),
              verticalSpace(24),
              HomeInfoRow(title: "Doctor Specialty"),
              verticalSpace(16),
              DoctorSpecialtyListView(),
              verticalSpace(16),
              HomeInfoRow(title: "Recommended Doctors"),
              verticalSpace(16),
              DoctorsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
