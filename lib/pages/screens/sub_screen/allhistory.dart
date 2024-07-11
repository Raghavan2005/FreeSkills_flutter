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
      body: Column(
        children: [
          Slidable(
            key: const ValueKey(0),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
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
            endActionPane: const ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  // An action can be bigger than the others.
                  flex: 2,
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
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 0.12.sh,
                      width: 0.5.sw,
                      color: Colors.green,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            maxLines: 2,
                            text: TextSpan(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.sp),
                                text: "freecodecamp sad"),
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
                    )
                  ],
                ),
              ),
            ),
          ),
          Slidable(
            key: const ValueKey(0),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
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
            endActionPane: const ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  // An action can be bigger than the others.
                  flex: 2,
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
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 0.12.sh,
                      width: 0.5.sw,
                      color: Colors.green,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            maxLines: 2,
                            text: TextSpan(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.sp),
                                text: "freecodecamp sad"),
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
