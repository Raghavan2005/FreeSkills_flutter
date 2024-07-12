import 'dart:core';

import 'package:flutter/cupertino.dart';

class PlayerstateProvider extends ChangeNotifier {
  bool _isFullscreen = false;
  double _videoPlayStatus = 435.0;

  bool get isFullscreen => _isFullscreen;

  double get videoPlayStatus => _videoPlayStatus;

  void updateIsFullscreen(bool isFullscreen) {
    _isFullscreen = isFullscreen;
    notifyListeners();
  }

  void updatevideostatus(double value) {
    _videoPlayStatus = value;
    notifyListeners();
  }
}
