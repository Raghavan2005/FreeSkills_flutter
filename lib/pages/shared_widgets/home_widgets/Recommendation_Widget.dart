import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_slider/card_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/UserDataState_Provider.dart';

class RecommendationWidget extends StatelessWidget {
  const RecommendationWidget({super.key, required this.titlename});

  final String titlename;

  @override
  Widget build(BuildContext context) {
    final usp = Provider.of<UserdatastateProvider>(context, listen: true);
    List<String> test = ["0100011", "0100021", "0100031"];
    List<Widget> valuesWidget = [];

    for (int i = 0; i < test.length; i++) {
      var itemKey = test[i].toString();
      if (usp.centraldataset.containsKey(itemKey)) {
        var item = usp.centraldataset[itemKey];
        var videoUrl = item["course_video_url"].toString();
        var langId = item["lang_id"].toString();

        valuesWidget.add(Stack(
          alignment: Alignment.topLeft,
          children: [
            // Video thumbnail
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://img.youtube.com/vi/$videoUrl/maxresdefault.jpg",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            // Overlay
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.black, Colors.transparent],
                ).createShader(bounds),
                blendMode: BlendMode.dstIn,
                child: Container(
                  height: 0.2350.sh,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            // Language ID
            Positioned(
              top: 0,
              left: 5,
              child: Text(
                langId,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 100.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
      } else {
        print('Error: Item with key $itemKey not found in centraldataset');
      }
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
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.left_chevron,
                          color: Colors.grey,
                          size: 14.sp,
                        ),
                        Text(
                          "Swipe Left",
                          style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          "Swipe Right",
                          style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                        ),
                        Icon(
                          CupertinoIcons.right_chevron,
                          color: Colors.grey,
                          size: 14.sp,
                        ),
                      ],
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
