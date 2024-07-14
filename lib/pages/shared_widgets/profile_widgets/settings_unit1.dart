import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../routes/RoutesNames.dart';
import 'Styled_Setting_Btn.dart';

class SettingsUnit1 extends StatelessWidget {
  const SettingsUnit1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        children: [
          Styled_Setting_Btn(
            onTap: () {
              context.push(Routesnames.SavedScreen);
            },
            btntext: 'Saved Videos',
            icondata: Icons.video_collection_outlined,
          ),
          SizedBox(
            height: 10.h,
          ),
          Styled_Setting_Btn(
            onTap: () {
              context.push(Routesnames.PremiumScreen);
            },
            btntext: 'Get Premium',
            icondata: Icons.workspace_premium,
          ),
          SizedBox(
            height: 10.h,
          ),
          Styled_Setting_Btn(
            onTap: () {
              context.push(Routesnames.SettingsScreen);
            },
            btntext: 'Settings',
            icondata: Icons.settings,
          ),
          SizedBox(
            height: 10.h,
          ),
          Styled_Setting_Btn(
            onTap: () {
              print('object');
            },
            btntext: 'Help and Feedback',
            icondata: Icons.help_center,
          ),
        ],
      ),
    );
  }
}
