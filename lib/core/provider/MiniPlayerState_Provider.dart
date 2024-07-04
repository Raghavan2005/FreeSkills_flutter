import 'package:flutter/cupertino.dart';
import 'package:miniplayer/miniplayer.dart';

class MiniplayerstateProvider extends ChangeNotifier {
  MiniplayerController controller = MiniplayerController();
  bool videoselected = false;
  final ValueNotifier<double> playerExpandProgress = ValueNotifier(70);

  void updatevideomini() {
    videoselected = !videoselected;
    notifyListeners();
  }
}
