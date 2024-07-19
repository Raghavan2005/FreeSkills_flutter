import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Allhistory extends StatelessWidget {
  const Allhistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 100.0,
        backgroundColor: Colors.black87,
        title: Text(
          "History",
          style: TextStyle(
              color: Colors.white54, fontWeight: FontWeight.bold, fontSize: 40),
        ),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Slidable(
            key: ValueKey(index),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: const [
                SlidableAction(
                  onPressed: null,
                  backgroundColor: Color(0xFF21B7CA),
                  foregroundColor: Colors.white,
                  icon: Icons.share,
                  label: 'Share',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
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
                    height: 0.12.sh,
                    width: 0.5.sw,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      // Adjust the radius as needed
                      child: Image.network(
                        "https://img.youtube.com/vi/bIYnu3spU7o/maxresdefault.jpg",
                      ),
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
                                  color: Colors.white, fontSize: 16.sp),
                              text:
                                  "Updated and added new Course On your Application",
                            ),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                          Text(
                            "freecodecamp",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 13.sp),
                          ),
                          Text(
                            "Tamil",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 13.sp),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
