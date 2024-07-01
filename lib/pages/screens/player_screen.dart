import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../shared_widgets/player_widgets.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldGradientBackground(
        body: SafeArea(child: PlayerWidgets()),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          tileMode: TileMode.decal,
          stops: [0.0, 0.70],
          colors: [
            Colors.white12,
            Colors.black12,
          ],
        ));
  }
}
