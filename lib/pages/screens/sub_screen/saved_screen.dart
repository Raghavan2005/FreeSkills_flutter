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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/provider/PlayerState_Provider.dart';
import '../../../core/provider/UserDataState_Provider.dart';
import '../../routes/RoutesNames.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  Future<void> onstart(BuildContext c) async {
    final usp = Provider.of<PlayerstateProvider>(c, listen: true);
    usp.updateonstart(c);
  }

  @override
  Widget build(BuildContext context) {
    final up = Provider.of<UserdatastateProvider>(context, listen: false);
    onstart(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 100.0,
        backgroundColor: Colors.black87,
        title: Text(
          "your_favorites",
          style: TextStyle(
              color: Colors.white54, fontWeight: FontWeight.bold, fontSize: 40),
        ).tr(),
      ),
      body: Consumer<PlayerstateProvider>(
        builder:
            (BuildContext context, PlayerstateProvider value, Widget? child) {
          return value.savedlist.isNotEmpty
              ? ListView.builder(
                  itemCount: value.savedlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    var itemdata = value.getitemlist(context, index);
                    String videourl = itemdata['course_video_url'];
                    return GestureDetector(
                      onTap: (){
                        context
                            .push(Routesnames.Player_Screen, extra: {"item": itemdata});
                      },
                      child: Slidable(
                        key: ValueKey(index),
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (r) {
                                Share.share(
                                    'Start Learn New Tech Today on FreeSkills https://share.freeskills.inapp/share/' +
                                        itemdata['lang_id'] +
                                        itemdata['course_id'] +
                                        itemdata['course_type'],
                                    subject: 'Look what I made!');
                              },
                              backgroundColor: Color(0xFF21B7CA),
                              foregroundColor: Colors.white,
                              icon: Icons.share,
                              label: 'Share',
                            ),
                          ],
                        ),
                        endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          dismissible: DismissiblePane(onDismissed: () {
                            value.swipupdatesave(itemdata['lang_id'] +
                                itemdata['course_id'] +
                                itemdata['course_type']);
                          }),
                          children: [
                            SlidableAction(
                              onPressed: null,
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: Icons.archive,
                              label: 'Remove',
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 0.5.sw,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://img.youtube.com/vi/$videourl/maxresdefault.jpg",
                                  placeholder: (context, url) => const SizedBox(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        maxLines: 2,
                                        text: TextSpan(
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp),
                                          text: itemdata['course_title'],
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                      ),
                                      Text(
                                        itemdata['course_channel_url'],
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13.sp),
                                      ),
                                      Text(
                                        up.searchbykey(up.langinfo, itemdata['lang_id']),
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    "Save Not Found",
                    style: TextStyle(color: Colors.grey, fontSize: 20.sp),
                  ),
                );
        },
      ),
    );
  }
}
