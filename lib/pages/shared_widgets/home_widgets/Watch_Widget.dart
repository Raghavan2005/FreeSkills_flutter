import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/UserDataState_Provider.dart';
import '../../routes/RoutesNames.dart';

class WatchWidget extends StatelessWidget {
  final String titlename;
  final List getlist;

  const WatchWidget(
      {super.key, required this.titlename, required this.getlist});

  dynamic getitemdatavalue(BuildContext c, String id) {
    final value = Provider.of<UserdatastateProvider>(c, listen: false);
    // print(getlist.length);
    return value.centraldataset[id];
  }

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
          ).tr(),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: getlist.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(1),
              itemBuilder: (BuildContext context, int index) {
                var data = getitemdatavalue(context, getlist[index]);
                String videourl = data['course_video_url'];

                return GestureDetector(
                  onTap: () {
                    context
                        .push(Routesnames.Player_Screen, extra: {"item": data});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      // Adjust the radius as needed
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://img.youtube.com/vi/$videourl/maxresdefault.jpg",
                        placeholder: (context, url) => const SizedBox(),
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
