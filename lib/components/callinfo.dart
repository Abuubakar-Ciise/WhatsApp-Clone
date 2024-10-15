import 'package:flutter/material.dart';

class CallInfoWidget extends StatelessWidget {
  final String imageURL;
  final String name;
  final bool isOutgoing;
  final String time;

  const CallInfoWidget(
      {super.key,
      required this.imageURL,
      required this.name,
      required this.isOutgoing,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Call info"),
        actions: const [
          Icon(
            Icons.message_outlined,
            size: 33,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.more_vert,
            size: 33,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Profile Picture
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(imageURL), // Load the image
                ),
                const SizedBox(width: 15),

                // Name and Call Icons
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Name
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Call and Video Call Icons
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.phone),
                            onPressed: () {
                              // Handle call action
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.videocam),
                            onPressed: () {
                              // Handle video call action
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            const Text("today"),
            const SizedBox(height: 40),
            Row(
              children: [
                const SizedBox(width: 20),
                Icon(
                  isOutgoing ? Icons.call_made : Icons.call_received,
                  size: 25,
                  color: isOutgoing ? Colors.green : Colors.red,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(isOutgoing ? "Outgoing" : "Incoming"),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 110,
                ),
                const Column(
                  children: [
                    
                    Text("    4:00"),
                     Text("100 MB")],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
