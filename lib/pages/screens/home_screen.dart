import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeskills/core/provider/MainState_Provider.dart';
import 'package:freeskills/pages/routes/RoutesNames.dart';
import 'package:freeskills/pages/shared_widgets/home_widgets/Recommendation_Widget.dart';
import 'package:freeskills/pages/shared_widgets/home_widgets/TechNews_Widget.dart';
import 'package:get/get.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:provider/provider.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

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
        return ScaffoldGradientBackground(
          body: SafeArea(
            child: PreloadPageView(
              physics: const NeverScrollableScrollPhysics(),
              preloadPagesCount: 1,
              controller: value.pageController,
              children: value.screenlist,
            ),
          ),
          bottomNavigationBar: const NavBar_Shared(),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.decal,
            stops: [0.0, 0.70],
            colors: [
              Colors.white12,
              Colors.black12,
            ],
          ),
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
          SizedBox(
            height: 10.h,
          ),
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
          ChannelsListWidget(),
          ElevatedButton(
              onPressed: () {
                Get.offAndToNamed(Routesnames.Player_Screen);
              },
              child: Text("Next"))
        ],
      ),
    );
  }
}
