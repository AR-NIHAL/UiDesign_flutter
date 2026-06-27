import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/theme.dart';
import 'package:recipe_app/providers/filter_provider.dart';
import 'package:recipe_app/screens/home_screen.dart';

class FlutterUIComponentsApp extends StatelessWidget {
  const FlutterUIComponentsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FilterProvider(),
      child: MaterialApp(
        title: 'Flutter UI Components',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
