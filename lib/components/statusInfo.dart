import 'package:flutter/material.dart';

class StatusInfo extends StatelessWidget {
  final String imageURL;
  final String name;
  final String timestamp;

  const StatusInfo({
    super.key,
    required this.imageURL,
    required this.timestamp,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false, 
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context), 
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(imageURL),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  timestamp,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              size: 28,
              color: Colors.white,
            ),
            onPressed: () {
             
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              imageURL,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Send a reply...",
                      hintStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.black54,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  onPressed: () {
                  
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
