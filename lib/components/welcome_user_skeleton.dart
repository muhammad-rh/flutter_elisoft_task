import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WelcomeUserSkeleton extends StatelessWidget {
  const WelcomeUserSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade900,
      highlightColor: Colors.grey.shade400,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.black12,
        ),
        width: 170,
        height: 30,
      ),
    );
  }
}
