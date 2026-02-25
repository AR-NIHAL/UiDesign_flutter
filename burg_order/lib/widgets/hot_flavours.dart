import 'package:burger_shop_ui/appcolors.dart';
import 'package:burger_shop_ui/food_item_model.dart';
import 'package:burger_shop_ui/widgets/section_header.dart';
import 'package:burger_shop_ui/widgets/trending_section.dart';
import 'package:flutter/material.dart';

class HotFlavoursSection extends StatelessWidget {
  HotFlavoursSection({super.key});

  final items =  [
    FoodItem(name: "Hot Muskaban", price: 30, imageUrl: "https://images.unsplash.com/photo-1541592106381-b31e9677c0e5?w=1200"),
    FoodItem(name: "Spicy Vadapav", price: 25, imageUrl: "https://images.unsplash.com/photo-1604908554027-922c3fb1f908?w=1200"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader("Hot Flavours"),
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

