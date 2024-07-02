import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdsWidgets extends StatelessWidget {
  final double height;

  const AdsWidgets({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: (height).sh,
      child: const Placeholder(
        child: Column(
          children: [
            Center(
              child: Text(
                "ads",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
