import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YtdisplayerWidget extends StatelessWidget {
  const YtdisplayerWidget(
      {super.key,
        required this.title,
        required this.channelname,
        required this.lang,
        required this.date, required this.videourl});

  final String title, channelname, lang, date,videourl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: double.infinity,
                  height: 0.25.sh,
                  child: CachedNetworkImage(
                    imageUrl:
                    "https://img.youtube.com/vi/$videourl/maxresdefault.jpg",
                    placeholder: (context, url) => const SizedBox(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10,bottom: 3),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black38),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        date,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Row(
                          children: [
                            Text(
                              channelname,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "•",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              lang,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.02.sh,
            ),
          ],
        ));
  }
}
