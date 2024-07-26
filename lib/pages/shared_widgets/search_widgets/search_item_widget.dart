import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget(
      {super.key,
      required this.imageurl,
      required this.titlename,
      required this.videolen,
      required this.channelname,
      required this.langname});

  final String imageurl, titlename, videolen, channelname, langname;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              // Shadow color
              spreadRadius: 3,
              // Spread radius
              blurRadius: 5,
              // Blur radius
              offset: const Offset(0, 3), // Shadow offset (x, y)
            ),
          ],
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            stops: [
              0.0,
              0.0,
              0.50,
            ],
            colors: [
              Colors.white12,
              Colors.black12,
              Colors.white12,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(alignment: Alignment.bottomRight, children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  // Adjust the radius as needed
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://img.youtube.com/vi/$imageurl/maxresdefault.jpg",
                    placeholder: (context, url) => const SizedBox(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black38),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        videolen,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ]),
              SizedBox(
                height: 10.h,
              ),
              Text(
                titlename,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10.h,
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
                    langname,
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
      ),
    );
  }
}
