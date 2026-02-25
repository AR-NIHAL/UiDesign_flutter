import 'package:burger_shop_ui/appcolors.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  CategoriesSection({super.key});

  final categories = const [
    _Category("Burgers", Icons.lunch_dining),
    _Category("Paratha", Icons.breakfast_dining),
    _Category("Maggie", Icons.ramen_dining),
    _Category("Muskaban", Icons.local_pizza),
    _Category("Chat", Icons.circle),
    _Category("Beverages", Icons.local_drink),
    _Category("Sandwiches", Icons.cookie),
    _Category("Puff", Icons.soup_kitchen),
    _Category("Chat Dishes", Icons.cake),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.s16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "What's On Your Mind?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.text),
          ),
          const SizedBox(height: AppSpace.s12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: AppSpace.s12,
              mainAxisSpacing: AppSpace.s12,
              childAspectRatio: 1.05,
            ),
            itemBuilder: (_, i) => CategoryTile(category: categories[i]),
          ),
        ],
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final _Category category;
  const CategoryTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.r16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(0, 4),
            color: Color(0x0F000000),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(category.icon, size: 34, color: AppColors.primary),
          const SizedBox(height: AppSpace.s8),
          Text(
            category.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.text, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _Category {
  final String title;
  final IconData icon;
  const _Category(this.title, this.icon);
}