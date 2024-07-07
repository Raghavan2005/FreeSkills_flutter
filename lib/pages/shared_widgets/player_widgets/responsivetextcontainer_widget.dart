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
        decoration: BoxDecoration(
          color: Color.fromRGBO(48, 48, 48, 100),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Padding(
            padding: const EdgeInsets.all(4.5),
            child: IntrinsicWidth(
              child: Row(
                children: [
                  Icon(
                    seticon,
                    color: Colors.white,
                    size: 13.sp,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
