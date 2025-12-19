import 'package:flutter/material.dart';
import 'package:tikino/presentation/widgets/containers/circle_overlay.dart';

class QuickStatsCardItem extends StatelessWidget {
  const QuickStatsCardItem({
    super.key,
    required this.label,
    required this.value,
    required this.bgColor,
  });

  final String label;
  final String value;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .1,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // overlay circles
          OverlayCircleShape(y: -10, x: -15, opacity: 0.2, size: 50),

          OverlayCircleShape(y: -10, x: -15, opacity: 0.1, size: 70),

          Positioned(
            top: 12,
            right: 18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  value,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
