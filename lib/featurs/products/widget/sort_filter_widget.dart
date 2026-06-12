import 'package:flutter/material.dart';
import '../../../common/custom_color.dart';

class SortFilterWidget extends StatelessWidget {
  final int totalCount;
  final String sortLabel;
  final VoidCallback onSortTap;

  const SortFilterWidget({
    super.key,
    required this.totalCount,
    this.sortLabel = "Popular",
    required this.onSortTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$totalCount Products",
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 13,
          ),
        ),
        GestureDetector(
          onTap: onSortTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: const Color(0xFF1D1D22),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.sort_rounded,
                  color:AppColors.primary,
                  size: 16,
                ),
                const SizedBox(width: 6),
                Text(
                  sortLabel,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.keyboard_arrow_down_rounded,
                    color: Colors.white54, size: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
