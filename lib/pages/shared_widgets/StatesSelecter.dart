// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:freeskills/core/provider/SetupState_Provider.dart';
import 'package:provider/provider.dart';

import 'LevelSelector_Widget.dart';

class LevelSelector extends StatelessWidget {
  const LevelSelector({super.key});

  @override
  Widget build(BuildContext context) {
    int ss = 107;
    return Consumer<SetupstateProvider>(
      builder: (BuildContext context, selectLevel, Widget? child) {
        int slevel = selectLevel.selectedlevel;
        return Row(
          children: [
            LevelSelector_Widget(
              selectLevelprovider: selectLevel,
              ss: ss,
              slevel: slevel,
              index: 0,
              name: "Beginner",
              fontsize: 20,
              selectoer: 0,
            ),
            LevelSelector_Widget(
              selectLevelprovider: selectLevel,
              ss: ss,
              slevel: slevel,
              index: 1,
              name: "Intermediate",
              fontsize: 15,
              selectoer: 0,
            ),
            LevelSelector_Widget(
              selectLevelprovider: selectLevel,
              ss: ss,
              slevel: slevel,
              index: 2,
              name: "Advanced",
              fontsize: 20,
              selectoer: 0,
            ),
          ],
        );
      },
    );
  }
}
