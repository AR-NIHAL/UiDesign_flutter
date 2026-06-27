import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageExample extends StatelessWidget {
  const ImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Asset Image:',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/start.png',
              width: 150,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 150,
                height: 120,
                color: Colors.grey.shade200,
                child: const Center(child: Text('No image')),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Network Image (cached):',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/150/120',
              width: 150,
              height: 120,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                width: 150,
                height: 120,
                color: Colors.grey.shade200,
                child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
              ),
              errorWidget: (_, __, ___) => Container(
                width: 150,
                height: 120,
                color: Colors.grey.shade200,
                child: const Icon(Icons.broken_image),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('BoxFit modes:'),
          const SizedBox(height: 8),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: BoxFit.values.map((fit) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 30,
                        color: Colors.grey.shade300,
                        child: Image.asset(
                          'assets/images/start.png',
                          width: 50,
                          height: 30,
                          fit: fit,
                          errorBuilder: (_, __, ___) => const SizedBox(),
                        ),
                      ),
                      Text(
                        fit.name.split('.').last,
                        style: const TextStyle(fontSize: 9),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

const imageCode = '''// Asset image (local file)
Image.asset('assets/images/start.png', width: 150, height: 120)

// Network image with caching (cached_network_image package)
CachedNetworkImage(
  imageUrl: 'https://picsum.photos/200',
  width: 150,
  height: 120,
  placeholder: (_, __) => CircularProgressIndicator(),
  errorWidget: (_, __, ___) => Icon(Icons.broken_image),
)

// Common BoxFit values: cover, contain, fill, fitWidth, fitHeight''';
