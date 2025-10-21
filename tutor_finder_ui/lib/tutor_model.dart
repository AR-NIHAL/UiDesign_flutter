import 'package:flutter/material.dart';

class Tutor {
  final String id;
  final String name;
  final String rate;
  final String bio;
  final IconData icon;

  Tutor({
    required this.id,
    required this.name,
    required this.rate,
    required this.bio,
    required this.icon,
  });
}

final List<Tutor> mockTutors = [
  Tutor(
    id: '1',
    name: 'Esrat Jahan Elora',
    rate: '\$80 / hr',
    bio: 'cjbksdbsd',
    icon: Icons.school,
  ),

  Tutor(
    id: '1',
    name: 'Esrat Jahan Elora',
    rate: '\$80 / hr',
    bio: 'cjbksdbsd',
    icon: Icons.school,
  ),
];
