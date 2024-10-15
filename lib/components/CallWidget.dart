import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/callinfo.dart';

class CallWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String time;
  final bool isOutgoing; 

  const CallWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.time,
    this.isOutgoing = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CallInfoWidget(
              imageURL: imageUrl,
              name:name,
              time:time,
              isOutgoing: isOutgoing,
            ),
          ),
        );
      },
      child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(imageUrl), 
          ),
          const SizedBox(width: 15),
          
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      isOutgoing ? Icons.call_made : Icons.call_received, 
                      size: 14,
                      color: isOutgoing ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      time,
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
          IconButton(
            onPressed: () {
            
            },
            icon: const Icon(
              Icons.phone,
              color: Colors.green,
            ),
          ),
        ],
      ),
    ),
    );
  }
}
