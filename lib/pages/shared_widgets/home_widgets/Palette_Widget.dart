import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palette_generator/palette_generator.dart';

class PaletterGen extends StatefulWidget {
  const PaletterGen({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  _PaletterGenState createState() => _PaletterGenState();
}

class _PaletterGenState extends State<PaletterGen> {
  Color? dominantColor;

  @override
  void initState() {
    super.initState();
    _updatePaletteGenerator();
  }

  Future<void> _updatePaletteGenerator() async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.imageUrl),
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
          width: 84.w,
          height: 84.h,
          decoration: BoxDecoration(
              color: dominantColor ?? Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(50)),
        ),
        Center(
            child: SizedBox(
                width: 60.w,
                height: 60.h,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(widget.imageUrl)))),
      ],
    );
  }
}
