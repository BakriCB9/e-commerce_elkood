import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmerEffect extends StatelessWidget {
  const LoadingShimmerEffect({super.key});

  static final _baseColor = Colors.grey.shade300;
  static final _highlightColor = Colors.grey.shade100;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildTabBar(),
            const SizedBox(height: 20),
            _buildGrid(),
          ],
        ),
      ),
    );
  }

  // ---------------- Widgets ----------------

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _shimmerBox(width: 120, height: 20),
        _shimmerCircle(radius: 16),
      ],
    );
  }

  Widget _buildTabBar() {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, __) => _shimmerBox(width: 80, height: 30, radius: 8),
      ),
    );
  }

  Widget _buildGrid() {
    return Expanded(
      child: GridView.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (_, __) => _shimmerBox(radius: 12),
      ),
    );
  }

  // ---------------- Helpers ----------------

  Widget _shimmerBox({double? width, double? height, double radius = 0}) {
    return Shimmer.fromColors(
      baseColor: _baseColor,
      highlightColor: _highlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }

  Widget _shimmerCircle({required double radius}) {
    return Shimmer.fromColors(
      baseColor: _baseColor,
      highlightColor: _highlightColor,
      child: CircleAvatar(radius: radius, backgroundColor: Colors.white),
    );
  }
}
