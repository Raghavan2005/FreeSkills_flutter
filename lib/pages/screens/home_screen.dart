import 'package:FreeSkills/core/provider/MainState_Provider.dart';
import 'package:FreeSkills/core/services/datasource/Data_Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/provider/SeetingsState_Provider.dart';
import '../../core/provider/UserDataState_Provider.dart';
import '../../core/provider/VideoDataState_Provider.dart';
import '../shared_widgets/NavBar_Shared.dart';
import '../shared_widgets/ads_widgets/AdBanner.dart';
import '../shared_widgets/home_widgets/Channels_List_Widget.dart';
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

    return SafeArea(
      child: ScaffoldGradientBackground(
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
    final video = Provider.of<VideodatastateProvider>(context, listen: false);
    await dy.dailyDataUpdate();
    await usp.updatedata();
    video.onstartandloadthelist(context);
  }

  @override
  Widget build(BuildContext context) {
    final usp = Provider.of<UserdatastateProvider>(context, listen: true);

    return SafeArea(
      child: Consumer<DataProvider>(
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
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
                        height: 5.h,
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
                    AdBanner(
                      adSize: AdSize.fullBanner,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TechnewsWidget(),
                    Visibility(
                      visible: false,
                      child: SizedBox(
                        width: double.infinity,
                        height: 0.26.sh, // or any height you need
                        child: const WatchWidget(
                          titlename: 'Continue Watching',
                          getlist: [],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 0.26.sh, // or any height you need
                      child: WatchOldWidget(
                        titlename: usp.selectedcoursename!,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const ChannelsListWidget(),
                    AdBanner(
                      adSize: AdSize.fullBanner,
                    ),
                    Consumer<VideodatastateProvider>(
                      builder: (BuildContext context,
                          VideodatastateProvider value, Widget? child) {
                        return Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 0.26.sh, // or any height you need
                              child: WatchWidget(
                                  titlename: 'Top Trends',
                                  getlist: value.toptrendslist),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 0.26.sh, // or any height you need
                              child: WatchWidget(
                                titlename: 'Experiment Yourself',
                                getlist: value.expreimentyour,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
