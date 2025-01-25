import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      width: 24,
      height: 24,
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}
