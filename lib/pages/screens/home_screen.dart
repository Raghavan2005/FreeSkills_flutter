import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeskills/core/provider/MainState_Provider.dart';
import 'package:freeskills/pages/shared_widgets/home_widgets/Recommendation_Widget.dart';
import 'package:freeskills/pages/shared_widgets/home_widgets/TechNews_Widget.dart';
import 'package:provider/provider.dart';

import '../shared_widgets/NavBar_Shared.dart';
import '../shared_widgets/home_widgets/Channels_List_Widget.dart';
import '../shared_widgets/home_widgets/User_ProfileBar_Widget.dart';
import '../shared_widgets/home_widgets/Watch_Widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainstateProvider>(
      builder: (BuildContext context, MainstateProvider value, Widget? child) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: value.currentnavtab,
              children: value.screenlist,
            ),
          ),
          bottomNavigationBar: const NavBar_Shared(),
        );
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UserProfilebar_Widget(),
          TechnewsWidget(),
          Visibility(
            visible: true,
            child: SizedBox(
              width: double.infinity,
              height: 0.26.sh, // or any height you need
              child: WatchWidget(),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 0.5.sh, // or any height you need
            child: RecommendationWidget(),
          ),
          SizedBox(
            height: 10.h,
          ),
          ChannelsListWidget()
        ],
      ),
    );
  }
}
