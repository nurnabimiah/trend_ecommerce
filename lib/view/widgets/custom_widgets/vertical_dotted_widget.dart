import 'package:flutter/material.dart';

class VerticalDottedWidget extends StatelessWidget {
  final double height;
  final Color color;
  final double dotSize;
  final double spacing;

  const VerticalDottedWidget({
    Key? key,
    this.height = 0,
    this.color = Colors.red,
    this.dotSize = 4.0,
    this.spacing = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: VerticalDottedLinePainter(
          color: color,
          dotSize: dotSize,
          spacing: spacing,
        ),
      ),
    );
  }
}

class VerticalDottedLinePainter extends CustomPainter {
  final Color color;
  final double dotSize;
  final double spacing;

  VerticalDottedLinePainter({
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

    double startY = 0;
    while (startY < size.height) {
      canvas.drawCircle(Offset(size.width / 2, startY), dotSize / 2, paint);
      startY += dotSize + spacing;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}