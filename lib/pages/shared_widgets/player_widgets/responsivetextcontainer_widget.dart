import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveTextContainer extends StatelessWidget {
  final String text;
  final IconData seticon;
  final Function fun;

  const ResponsiveTextContainer(
      {super.key,
      required this.text,
      required this.seticon,
      required this.fun});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => fun,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IntrinsicWidth(
          child: Row(
            children: [
              Icon(seticon, color: Colors.black),
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
