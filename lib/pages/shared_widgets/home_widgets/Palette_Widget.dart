import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palette_generator/palette_generator.dart';

class PaletterGen extends StatefulWidget {
  @override
  _PaletterGenState createState() => _PaletterGenState();
}

class _PaletterGenState extends State<PaletterGen> {
  final String imageUrl =
      "https://yt3.googleusercontent.com/4X_ATxXu9nbdogbMjXcPOJLD5sqEfaqGwO5qqk3ZVklpIuq1m_FLRKbu3WZA3dkjHD2b8-KNrQ=s160-c-k-c0x00ffffff-no-rj";
  Color? dominantColor;

  @override
  void initState() {
    super.initState();
    _updatePaletteGenerator();
  }

  Future<void> _updatePaletteGenerator() async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(imageUrl),
    );
    setState(() {
      dominantColor = paletteGenerator.dominantColor?.color ?? Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
              color: dominantColor ?? Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(50)),
        ),
        Center(
            child: SizedBox(
                width: 70.w,
                height: 70.h,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(imageUrl)))),
      ],
    );
  }
}
