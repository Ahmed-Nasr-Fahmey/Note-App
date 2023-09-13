import 'package:flutter/material.dart';
import '../../constants.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isActive,
    required this.color,
  });
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: color,
                radius: 38,
              ),
              const Icon(
                Icons.check,
                size: 32,
                color: kSecoundColor,
              )
            ],
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 38,
          );
  }
}
