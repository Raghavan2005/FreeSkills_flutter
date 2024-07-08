import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notification_item extends StatelessWidget {
  const Notification_item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        height: 0.1.sh,
        decoration: BoxDecoration(
            color: Colors.white24, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            SizedBox(
              width: 0.2.sw,
              child: Placeholder(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  textAlign: TextAlign.start,
                  textWidthBasis: TextWidthBasis.parent,
                  text: TextSpan(
                    text: "Updated and added new Course On your Application",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      // You can customize the color and other text styles here
                      fontSize: 16.0, // Adjust the font size as needed
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
