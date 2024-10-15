import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/statusInfo.dart';

class ViewedUpdatesWidget extends StatelessWidget {
  final String imageURL;
  final String name;
  final String timestamp;

  const ViewedUpdatesWidget({
    super.key,
    required this.imageURL,
    required this.name,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>StatusInfo(
              imageURL: imageURL,
              name: name,
              timestamp: timestamp,
            )),
          );
      },
      child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(imageURL), 
          ),
          const SizedBox(width: 16.0),
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
              Text(
                timestamp,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    );
  }
}
