import 'package:flutter/material.dart';


class StatusWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String subtitle;
  
  const StatusWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(imageUrl),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
