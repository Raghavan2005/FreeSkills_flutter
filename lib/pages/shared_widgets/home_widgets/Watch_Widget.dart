import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../routes/RoutesNames.dart';

class WatchWidget extends StatelessWidget {
  final String titlename;

  const WatchWidget({super.key, required this.titlename});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titlename,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 19.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(1),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    context.push(Routesnames.Player_Screen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      // Adjust the radius as needed
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://img.youtube.com/vi/bIYnu3spU7o/maxresdefault.jpg",
                        placeholder: (context, url) => Container(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
