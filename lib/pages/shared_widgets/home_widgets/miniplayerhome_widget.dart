import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MiniplayerhomeWidget extends StatelessWidget {
  const MiniplayerhomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        children: [
          Container(
            width: 0.3.sw,
            color: Colors.green,
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Column(
              children: [
                Text(
                  "title",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "title",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              //     value.updatevideomini();
              //   value.controller.dispose();
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 30.sp,
            ),
          )
        ],
      ),
    );
  }
}
