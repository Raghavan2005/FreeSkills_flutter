import 'package:flutter/material.dart';
import 'package:freeskills/core/provider/MainState_Provider.dart';
import 'package:freeskills/pages/shared_widgets/TechNews_Widget.dart';
import 'package:provider/provider.dart';

import '../shared_widgets/NavBar_Shared.dart';
import '../shared_widgets/User_ProfileBar_Widget.dart';

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
          bottomNavigationBar: NavBar_Shared(),
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
    return const Column(
      children: [UserProfilebar_Widget(), TechnewsWidget()],
    );
  }
}
