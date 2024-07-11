import 'package:card_slider/card_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationWidget extends StatelessWidget {
  const RecommendationWidget({super.key});

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
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: valuesDataColors[i],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Text(
              i.toString(),
              style: TextStyle(
                color: Colors.white,
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
            'Mobile App Developer',
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
