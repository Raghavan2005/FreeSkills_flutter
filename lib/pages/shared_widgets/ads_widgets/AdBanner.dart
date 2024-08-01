/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 +   Freeskills (Andorid&iso)                                                 +
 +   Copyright (c) 2024 Raghavan                                              +
 +   GitHub: https://github.com/raghavan2005                                  +
 +   All rights reserved..                                                    +
 +                                                                            +
 +                                                                            +
 +                                                                            +
 +                                                                            +
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdBanner extends StatefulWidget {
  @override
  _AdBannerState createState() => _AdBannerState();
  final AdSize adSize;

  AdBanner({Key? key, required this.adSize}) : super(key: key);
}

class _AdBannerState extends State<AdBanner> {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();

    _bannerAd = BannerAd(
      adUnitId: 'ca-addpp-pub-3940256099942544/6300978111',
      // Replace with your actual ad unit ID
      size: widget.adSize,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            // Ad loaded
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
          //print('Ad failed to load: $error');
        },
      ),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return _bannerAd == null
        ? Offstage(
            offstage: true,
          )
        : Container(
            width: _bannerAd!.size.width.toDouble(),
            height: _bannerAd!.size.height.toDouble(),
            child: AdWidget(ad: _bannerAd!),
          );
  }
}
