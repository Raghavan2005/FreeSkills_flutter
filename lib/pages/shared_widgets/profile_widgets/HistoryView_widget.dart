import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/PlayerState_Provider.dart';
import '../../routes/RoutesNames.dart';

class HistoryviewWidget extends StatelessWidget {
  final String titlename;

  HistoryviewWidget({super.key, required this.titlename});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                titlename,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 19.sp),
              ).tr(),
              Spacer(),
              OutlinedButton(
                  onPressed: () {
                    context.push(Routesnames.AllhistoryScreen);
                  },
                  style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                  child: Text(
                    "view_all",
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  ).tr())
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: Consumer<PlayerstateProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return ListView.builder(
                  itemCount: value.historylist.length <= 5
                      ? value.historylist.length
                      : 5,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(1),
                  itemBuilder: (BuildContext context, int index) {
                   var itemdata = value.getitemhistorlist(context, index);
                    String videourl = itemdata['course_video_url'];
                    String videotitle = itemdata['course_title'];
                    return GestureDetector(
                      onTap: () {
                        print(itemdata.runtimeType);
                        context.push(Routesnames.Player_Screen,
                            extra: {"item": itemdata});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 0.12.sh,
                              width: 0.5.sw,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                // Adjust the radius as needed
                                child: Image.network(
                                  "https://img.youtube.com/vi/$videourl/maxresdefault.jpg",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: SizedBox(
                                width: 0.4.sw,
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  textWidthBasis: TextWidthBasis.parent,
                                  text: TextSpan(
                                    text: videotitle,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      // You can customize the color and other text styles here
                                      fontSize:
                                          14.0, // Adjust the font size as needed
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
