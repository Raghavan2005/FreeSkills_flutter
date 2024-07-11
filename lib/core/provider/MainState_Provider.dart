import 'package:FreeSkills/pages/screens/aichat_screen.dart';
import 'package:FreeSkills/pages/screens/profile_screen.dart';
import 'package:FreeSkills/pages/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';

import '../../pages/screens/home_screen.dart';

class MainstateProvider extends ChangeNotifier {
  int currentnavtab = 0;
  int currentiindexnews = 0;
  final PreloadPageController pageController =
      PreloadPageController(keepPage: true);
  List<Color> nav_select = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple
  ];
  List<Widget> screenlist = [
    const Home(),
    // const ShortsScreen(),
    const AichatScreen(),
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
  List<String> channeltempurl = [
    "https://yt3.googleusercontent.com/ytc/AIdro_kt_IEZATxzTDsyEt3JM9QNiJ_Iz8EHd-8WY2WKdkfTR2g=s160-c-k-c0x00ffffff-no-rj",
    "https://yt3.googleusercontent.com/_2c41sEkRR3V5KxC6Ta-OTZE2gSVB0p5gMhVsHY9lzskm3xYcsXl4PIYVWc5q-3ASJl30RIktA=s160-c-k-c0x00ffffff-no-rj",
    "https://yt3.googleusercontent.com/ytc/AIdro_kwuzOzplcCg5m4Pkb_5bwJE7mg6yFiMcjIhSd251DAxw=s160-c-k-c0x00ffffff-no-rj",
    "https://yt3.googleusercontent.com/BH2h8XDQujtBNCdDYiYv7QezPwOmqZGWAnfmQVvN49rrsPENMt383ZSClki4hS9AABAlaU-WyQ=s160-c-k-c0x00ffffff-no-rj",
    "https://yt3.googleusercontent.com/zgMN9BuSQByG1SrpmLwcNB3MQhjDhS_pl9H1h7TaRievMfS4UpU7Z36j77z5_hnIW4N8uFX3NA=s160-c-k-c0x00ffffff-no-rj",
    "https://yt3.googleusercontent.com/o59vIBnJHWO6W3sD6frUdGLKNvDOBaeqe45U3wAn1jo4i95zHfntj29oIwc1PhY-tuXf0nXl=s160-c-k-c0x00ffffff-no-rj",
    "https://yt3.googleusercontent.com/ytc/AIdro_n8JEk_OKyvAE7tq8xZHT9NbmfeICRvz5RicySVMtFymQ=s160-c-k-c0x00ffffff-no-rj"
  ];

  void updatenavstate(int index) {
    currentnavtab = index;
    pageController.jumpToPage(currentnavtab);
    notifyListeners();
  }

  void updatestatenews(int i) {
    currentiindexnews = i;
    notifyListeners();
  }
}
