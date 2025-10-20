import 'package:flutter/material.dart';
import 'package:tutor_finder_ui/dir_screen.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TutorDirScreen());
  }
}
