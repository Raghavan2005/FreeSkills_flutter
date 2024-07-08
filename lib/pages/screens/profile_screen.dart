import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared_widgets/profile_widgets/HistoryView_widget.dart';
import '../shared_widgets/profile_widgets/Progressbar_widget.dart';
import '../shared_widgets/profile_widgets/UserEditProfile_Widget.dart';

// ignore: camel_case_types
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          UsereditprofileWidget(),
          ProgressbarWidget(),
          SizedBox(
            width: double.infinity,
            height: 0.35.sh, // or any height you need
            child: const HistoryviewWidget(
              titlename: 'History',
            ),
          ),
        ],
      ),
    );
  }
}
