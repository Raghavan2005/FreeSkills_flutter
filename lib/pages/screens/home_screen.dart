import 'package:FreeSkills/core/provider/MainState_Provider.dart';
import 'package:FreeSkills/pages/shared_widgets/home_widgets/Recommendation_Widget.dart';
import 'package:FreeSkills/pages/shared_widgets/home_widgets/Recommendationold_Widget.dart';
import 'package:FreeSkills/pages/shared_widgets/home_widgets/TechNews_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:provider/provider.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../../core/provider/SeetingsState_Provider.dart';
import '../../core/provider/UserDataState_Provider.dart';
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
              preloadPagesCount: 0,
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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final fullscreenProvider =
        Provider.of<SeetingsstateProvider>(context, listen: false);
    final usp = Provider.of<UserdatastateProvider>(context, listen: false);
    usp.updatedata();
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: [
              UserProfilebar_Widget(username: usp.getUsername),
              SizedBox(
                height: 10.h,
              ),
              TechnewsWidget(),
              Visibility(
                visible: true,
                child: SizedBox(
                  width: double.infinity,
                  height: 0.26.sh, // or any height you need
                  child: const WatchWidget(
                    titlename: 'Continue Watching',
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              !fullscreenProvider.isoldrecom
                  ? RecommendationWidget(
                      titlename: 'Modile App Development',
                    )
                  : SizedBox(
                      width: double.infinity,
                      height: 0.26.sh, // or any height you need
                      child: const WatchOldWidget(
                        titlename: 'Modile App Development',
                      ),
                    ),
              SizedBox(
                height: 10.h,
              ),
              ChannelsListWidget(),
              SizedBox(
                width: double.infinity,
                height: 0.26.sh, // or any height you need
                child: const WatchWidget(
                  titlename: 'Top Trends',
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 0.26.sh, // or any height you need
                child: const WatchWidget(
                  titlename: 'Experiment Yourself',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
