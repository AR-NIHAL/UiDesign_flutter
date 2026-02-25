import 'package:burger_shop_ui/appcolors.dart';
import 'package:burger_shop_ui/food_item_model.dart';
import 'package:burger_shop_ui/widgets/section_header.dart';
import 'package:burger_shop_ui/widgets/trending_section.dart';
import 'package:flutter/material.dart';

class BestSellerSection extends StatelessWidget {
  BestSellerSection({super.key});

  final items = [
    FoodItem(name: "Best Burger", price: 60, imageUrl: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=1200"),
    FoodItem(name: "Best Paratha", price: 45, imageUrl: "https://images.unsplash.com/photo-1601050690597-df0568f70950?w=1200"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader("Best Seller"),
        const SizedBox(height: AppSpace.s12),
        SizedBox(
          height: 160,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.s16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, i) => TrendingCard(item: items[i]),
            separatorBuilder: (_, __) => const SizedBox(width: AppSpace.s12),
            itemCount: items.length,
          ),
        ),
      ],
    );
  }
}

