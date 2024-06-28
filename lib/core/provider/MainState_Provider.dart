import 'package:flutter/material.dart';
import 'package:freeskills/pages/screens/profile_screen.dart';
import 'package:freeskills/pages/screens/search_screen.dart';
import 'package:freeskills/pages/screens/shorts_screen.dart';

import '../../pages/screens/home_screen.dart';

class MainstateProvider extends ChangeNotifier {
  int currentnavtab = 0;
  List<Color> nav_select = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple
  ];
  List<Widget> screenlist = [
    const Home(),
    const ShortsScreen(),
    const SearchScreen(),
    const ProfileScreen()
  ];
  List<String> newtemp = [
    "OpenAI Develops CriticGPT Model Capable of Spotting GPT-4 Code Generation Errors",
    "Bolivia Reverses Bitcoin Ban, Legalises Crypto Transactions for Banks",
    "Character.AI Introduces Character Calls Feature That Lets Users 'Call' AI Chatbots	",
    "CMF Phone 1 Specifications Revealed Ahead of Launch on July 8; to Feature MediaTek Dimensity 7300 Chipset",
    "Truecaller Fraud Insurance Launched in India for iOS and Android Users",
    "Oppo Reno 12F 5G With MediaTek Dimensity 6300 SoC, 5,000mAh Battery Unveiled: Specifications",
    "RBI Releases Financial Stability Report With Mention of DeFi, US Efforts to Regulate Crypto Sector"
  ];

  void updatenavstate(int index) {
    currentnavtab = index;
    notifyListeners();
  }
}
