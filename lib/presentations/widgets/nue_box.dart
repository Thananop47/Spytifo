import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;

  const NeuBox({
    super.key,
    required this.child,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // กำหนด width
      height: height, // กำหนด height
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 15,
            offset: const Offset(4, 4),
          ),
          BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            offset: const Offset(-4, -4),
          )
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: child,
    );
  }
}
