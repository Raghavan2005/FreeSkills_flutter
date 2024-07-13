import 'package:flutter/material.dart';

class LineLoadingAnimation extends StatefulWidget {
  final double width;
  final double height;
  final Color color;
  final Duration duration;

  LineLoadingAnimation({
    this.width = 200.0,
    this.height = 5.0,
    this.color = Colors.blue,
    this.duration = const Duration(seconds: 2),
  });

  @override
  _LineLoadingAnimationState createState() => _LineLoadingAnimationState();
}

class _LineLoadingAnimationState extends State<LineLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: LinePainter(_animation.value, widget.color),
          child: Container(
            width: widget.width,
            height: widget.height,
          ),
        );
      },
    );
  }
}

class LinePainter extends CustomPainter {
  final double progress;
  final Color color;

  LinePainter(this.progress, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.height
      ..strokeCap = StrokeCap.round;

    final startX = 0.0;
    final endX = size.width * progress;

    canvas.drawLine(
        Offset(startX, size.height / 2), Offset(endX, size.height / 2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class DotJumpingAnimation extends StatefulWidget {
  final double dotSize;
  final double dotSpacing;
  final Color dotColor;
  final Duration duration;
  final int dotCount;

  DotJumpingAnimation({
    this.dotSize = 10.0,
    this.dotSpacing = 5.0,
    this.dotColor = Colors.white,
    this.duration = const Duration(seconds: 1),
    this.dotCount = 3,
  });

  @override
  _DotJumpingAnimationState createState() => _DotJumpingAnimationState();
}

class _DotJumpingAnimationState extends State<DotJumpingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();

    _animations = List.generate(widget.dotCount, (index) {
      final start = index / widget.dotCount;
      final end = (index + 1) / widget.dotCount;
      return Tween<double>(begin: 0, end: -15).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeInOut),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.dotCount, (index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _animations[index].value),
              child: Container(
                width: widget.dotSize,
                height: widget.dotSize,
                margin: EdgeInsets.symmetric(horizontal: widget.dotSpacing / 2),
                decoration: BoxDecoration(
                  color: widget.dotColor,
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
