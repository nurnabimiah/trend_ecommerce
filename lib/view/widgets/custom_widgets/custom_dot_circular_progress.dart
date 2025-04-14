import 'package:flutter/material.dart';
import 'dart:math';

class DotCircularLoading extends StatefulWidget {
  final double size;
  final int dotCount;
  final Color color;

  DotCircularLoading({
    this.size = 50.0,
    this.dotCount = 8,
    this.color = Colors.blue,
  });

  @override
  _DotCircularLoadingState createState() => _DotCircularLoadingState();
}

class _DotCircularLoadingState extends State<DotCircularLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: List.generate(widget.dotCount, (index) {
              final angle = (2 * pi / widget.dotCount) * index;
              final radius = widget.size / 2;

              return Transform.translate(
                offset: Offset(
                  radius * cos(angle + (_controller.value * 2 * pi)),
                  radius * sin(angle + (_controller.value * 2 * pi)),
                ),
                child: Container(
                  width: widget.size * 0.1,
                  height: widget.size * 0.1,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.color.withOpacity(
                      (index + 1) / widget.dotCount, // Gradual opacity
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}