import 'package:burger_shop_ui/appcolors.dart';
import 'package:burger_shop_ui/widgets/best_seller.dart';
import 'package:burger_shop_ui/widgets/bottomnav.dart';
import 'package:burger_shop_ui/widgets/categorie_section.dart';
import 'package:burger_shop_ui/widgets/hot_flavours.dart';
import 'package:burger_shop_ui/widgets/trending_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.bg,
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      bottomNavigationBar: const HomeBottomNav(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: AppSpace.s12)),

            // 2) Trending
            SliverToBoxAdapter(child: TrendingSection()),

            SliverToBoxAdapter(child: SizedBox(height: AppSpace.s16)),

            // 3) What's on your mind
            SliverToBoxAdapter(child: CategoriesSection()),

            SliverToBoxAdapter(child: SizedBox(height: AppSpace.s16)),

            // 4) Hot Flavours
            SliverToBoxAdapter(child: HotFlavoursSection()),

            SliverToBoxAdapter(child: SizedBox(height: AppSpace.s16)),

            // 5) Best Seller
            SliverToBoxAdapter(child: BestSellerSection()),

            SliverToBoxAdapter(child: SizedBox(height: AppSpace.s24)),
          ],
        ),
      ),
    );
  }
}