import 'package:burger_shop_ui/appcolors.dart';
import 'package:burger_shop_ui/food_item_model.dart';
import 'package:burger_shop_ui/widgets/section_header.dart';
import 'package:flutter/material.dart';

class TrendingSection extends StatelessWidget {
  TrendingSection({super.key});

  final items = const [
    FoodItem(name: "Butter Muskaban", price: 30, imageUrl: "https://images.unsplash.com/photo-1541592106381-b31e9677c0e5?w=1200"),
    FoodItem(name: "Bombay Vadapav", price: 25, imageUrl: "https://images.unsplash.com/photo-1604908554027-922c3fb1f908?w=1200"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader("Trending Items"),
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

class TrendingCard extends StatelessWidget {
  final FoodItem item;
  const TrendingCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.r16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 12,
            offset: Offset(0, 6),
            color: Color(0x14000000),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.r16),
        child: Stack(
          children: [
            // Image
            Positioned.fill(
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
              ),
            ),

            // Price badge
            Positioned(
              left: AppSpace.s10,
              top: AppSpace.s10,
              child: _PriceChip(price: item.price),
            ),

            // Bottom gradient + name + add button
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(AppSpace.s12),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0xAA000000), Color(0x00000000)],
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpace.s8),
                    _AddButton(onTap: () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceChip extends StatelessWidget {
  final int price;
  const _PriceChip({required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.chipRed,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "₹ $price",
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final VoidCallback onTap;
  const _AddButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          "Add+",
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w900,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

