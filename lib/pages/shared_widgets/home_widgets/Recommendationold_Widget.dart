import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/UserDataState_Provider.dart';
import '../../routes/RoutesNames.dart';

class WatchOldWidget extends StatelessWidget {
  final String titlename;

  WatchOldWidget({super.key, required this.titlename});

  List joblist = [];

  onstartupdatedatatset(dynamic c, String cousekey) {
    // print(c[cousekey]);
    joblist = c[cousekey];
  }

  @override
  Widget build(BuildContext context) {
    final usp = Provider.of<UserdatastateProvider>(context, listen: true);
    return FutureBuilder(
      future: onstartupdatedatatset(usp.centraljoblist, usp.getSelectedcource!),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titlename,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: joblist.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(1),
                  itemBuilder: (BuildContext context, int index) {
                    var itemKey = joblist[index].toString();
                    var item = usp.centraldataset[itemKey];
                    var videoUrl = item["course_video_url"].toString();
                    return GestureDetector(
                      onTap: () {
                        context.push(Routesnames.Player_Screen,
                            extra: {"item": item});
                      },
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Row(
                            children: [
                              Text(
                                (index + 1).toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 100.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 0.009.sw,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  // Adjust the radius as needed
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://img.youtube.com/vi/$videoUrl/maxresdefault.jpg",
                                    placeholder: (context, url) =>
                                        const SizedBox(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 0.05.sw,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
