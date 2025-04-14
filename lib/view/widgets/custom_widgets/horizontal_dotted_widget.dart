import 'package:flutter/material.dart';

class HorizontalDottedWidget extends StatelessWidget {
  final double width;
  final Color color;
  final double dotSize;
  final double spacing;

  const HorizontalDottedWidget({
    super.key,
    this.width = 0,
    this.color = Colors.red,
    this.dotSize = 4.0,
    this.spacing = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: CustomPaint(
        painter: HorizontalDottedLinePainter(
          color: color,
          dotSize: dotSize,
          spacing: spacing,
        ),
      ),
    );
  }
}

class HorizontalDottedLinePainter extends CustomPainter {
  final Color color;
  final double dotSize;
  final double spacing;

  HorizontalDottedLinePainter({
    required this.color,
    this.dotSize = 4.0,
    this.spacing = 4.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = dotSize;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawCircle(Offset(startX, size.height / 2), dotSize / 2, paint);
      startX += dotSize + spacing;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
