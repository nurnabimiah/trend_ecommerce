import 'package:flutter/material.dart';

class CustomRatingWidget extends StatelessWidget {
  final double rating;
  const CustomRatingWidget({
    required this.rating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double filledPortion = (rating / 1) * 10;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(
          Icons.star,
          color: Colors.grey,
          size: 20.0,
        ),
        ClipRect(
          clipper: _StarClipper(percentage: filledPortion / 10),
          child:  Icon(
            Icons.star,
            color: Colors.purple,
            size: 20.0,
          ),
        ),
      ],
    );
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final double percentage;

  _StarClipper({required this.percentage});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width * percentage, size.height);
  }

  @override
  bool shouldReclip(_StarClipper oldClipper) {
    return oldClipper.percentage != percentage;
  }
}