import 'package:FreeSkills/core/provider/MainState_Provider.dart';
import 'package:FreeSkills/core/services/datasource/Data_Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/provider/SeetingsState_Provider.dart';
import '../../core/provider/UserDataState_Provider.dart';
import '../shared_widgets/NavBar_Shared.dart';
import '../shared_widgets/ads_widgets/ads_widget.dart';
import '../shared_widgets/home_widgets/Channels_List_Widget.dart';
import '../shared_widgets/home_widgets/Recommendation_Widget.dart';
import '../shared_widgets/home_widgets/Recommendationold_Widget.dart';
import '../shared_widgets/home_widgets/TechNews_Widget.dart';
import '../shared_widgets/home_widgets/User_ProfileBar_Widget.dart';
import '../shared_widgets/home_widgets/Watch_Widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<SeetingsstateProvider>(context, listen: false);
    Provider.of<UserdatastateProvider>(context, listen: true);

    return ScaffoldGradientBackground(
      body: Consumer<MainstateProvider>(
        builder:
            (BuildContext context, MainstateProvider value, Widget? child) {
          return PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: value.pageController,
            children: value.screenlist,
          );
        },
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
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      firstUpdate(context);
    });
  }

  Future<void> firstUpdate(BuildContext context) async {
    final dy = Provider.of<DataProvider>(context, listen: false);
    final usp = Provider.of<UserdatastateProvider>(context, listen: false);
    await dy.dailyDataUpdate();
    await usp.updatedata();
  }

  @override
  Widget build(BuildContext context) {
    final set = Provider.of<SeetingsstateProvider>(context, listen: false);
    final usp = Provider.of<UserdatastateProvider>(context, listen: true);

    return Consumer<DataProvider>(
      builder: (BuildContext context, DataProvider value, Widget? child) {
        if (value.isLoading) {
          BoxDecoration bd = BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25));
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Shimmer.fromColors(
              baseColor: Colors.white12,
              highlightColor: Colors.white24,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Container(
                      width: double.infinity,
                      height: 0.23.sh,
                      decoration: bd,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Container(
                      width: double.infinity,
                      height: 0.08.sh,
                      decoration: bd,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Container(
                      width: double.infinity,
                      height: 0.20.sh,
                      decoration: bd,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Container(
                      width: double.infinity,
                      height: 0.30.sh,
                      decoration: bd,
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          if (value.data.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  UserProfilebar_Widget(
                    username: usp.getUsername,
                    courename: usp.selectedcoursename,
                    imageurl: usp.userimageurl,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AdsWidgets(height: 0.08),
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
                  !set.isoldrecom
                      ? RecommendationWidget(
                          titlename: usp.selectedcoursename!,
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
                  AdsWidgets(height: 0.08),
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
            );
          }
        }
      },
    );
  }
}
