import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/provider/ShortsState_Provider.dart';
import '../shared_widgets/shorts_widgets/shorts_player_widgets.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key});

  @override
  State<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShortsstateProvider>(
      builder:
          (BuildContext context, ShortsstateProvider value, Widget? child) {
        return PageView(
          scrollDirection: Axis.vertical,
          onPageChanged: (index) {
            value.updatepage(index);
          },
          children: value.listofvidos
              .map((videoId) => ShortsPlayerWidgets(
                    videoid: videoId,
                  ))
              .toList(),
        );
      },
    );
  }
}
