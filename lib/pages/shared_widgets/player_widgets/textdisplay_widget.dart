import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextdisplayWidget extends StatelessWidget {
  final String text;
  final IconData iconData;

  const TextdisplayWidget({
    super.key,
    required this.text,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: Container(
        padding: const EdgeInsets.all(3.5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IntrinsicWidth(
          child: Row(
            children: [
              Icon(
                iconData,
                color: Colors.black,
                size: 13.sp,
              ),
              const SizedBox(width: 2),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
