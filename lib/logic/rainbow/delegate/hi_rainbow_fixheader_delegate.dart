import 'package:flutter/material.dart';

class HiRainbowFixHeaderDelegate extends SliverPersistentHeaderDelegate {
  HiRainbowFixHeaderDelegate(this.minHeight, this.maxHeight, this.child);
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(child: child);
  }

  @override
  bool shouldRebuild(HiRainbowFixHeaderDelegate oldDelegate) {
    return false;
  }
}
