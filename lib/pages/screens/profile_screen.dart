import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../../core/provider/PlayerState_Provider.dart';
import '../shared_widgets/ads_widgets/AdBanner.dart';
import '../shared_widgets/profile_widgets/HistoryView_widget.dart';
import '../shared_widgets/profile_widgets/Progressbar_widget.dart';
import '../shared_widgets/profile_widgets/UserEditProfile_Widget.dart';
import '../shared_widgets/profile_widgets/settings_unit1.dart';

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
          AdBanner(
            adSize: AdSize.fullBanner,
          ),
          Consumer<PlayerstateProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return Offstage(
                offstage: value.historylist.isNotEmpty ? false : true,
                child: SizedBox(
                  width: double.infinity,
                  height: 0.30.sh, // or any height you need
                  child: HistoryviewWidget(
                    titlename: 'recent_activity',
                  ),
                ),
              );
            },
          ),
          SettingsUnit1()
        ],
      ),
    );
  }
}
