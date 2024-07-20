import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_slider/card_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationWidget extends StatelessWidget {
  const RecommendationWidget({super.key, required this.titlename});

  final String titlename;

  @override
  Widget build(BuildContext context) {
    List<Color> valuesDataColors = [
      Colors.purple,
      Colors.yellow,
      Colors.green,
      Colors.red,
      Colors.grey,
      Colors.blue,
      Colors.grey,
      Colors.blue,
    ];

    List<Widget> valuesWidget = [];
    for (int i = 1; i < valuesDataColors.length; i++) {
      valuesWidget.add(Stack(
        alignment: Alignment.topLeft,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              // Adjust the radius as needed
              child: Stack(children: [
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(bounds),
                  blendMode: BlendMode.dstIn,
                ),
                CachedNetworkImage(
                  imageUrl:
                      "https://img.youtube.com/vi/bIYnu3spU7o/maxresdefault.jpg",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
              ]),
            ),
          ),
          Positioned(
            top: 0,
            child: Text(
              i.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ));
    }

    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titlename,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
            ),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CardSlider(
                cards: valuesWidget,
                bottomOffset: .00003,
                cardHeight: 0.6,
                itemDotOffset: 0.20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Swipe Left",
                      style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                    ),
                    Spacer(),
                    Text(
                      "Swipe Right",
                      style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
