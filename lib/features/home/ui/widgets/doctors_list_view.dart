import 'package:flutter/material.dart';
import '../../data/models/specialization_response_model.dart';

import 'doctors_list_view_item.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctors?>? doctorsList;
  const DoctorsListView({super.key, required this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList?.length,
        itemBuilder: (context, index) {
          return DoctorsListViewItem(
            itemIndex: index,
            doctorData: doctorsList?[index],
          );
        },
      ),
    );
  }
}
