import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/chatsReplays.dart';

class UserInfoScreen extends StatelessWidget {
  final String imageURL;
  final String name;
  final String? role;
  final String message; // Last message
  final String time; // Last message time

  const UserInfoScreen({
    super.key,
    required this.imageURL,
    required this.name,
    this.role,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> messages = [
      {"message": "Hello, how are you?", "isReply": false},
      {"message": "I'm doing well, thanks! How about you?", "isReply": true},
      {"message": "Have you seen the latest news?", "isReply": false},
      {"message": "No, I haven't. What's up?", "isReply": true},
      {"message": "It's quite interesting! Let me share the link with you.", "isReply": false},
    ];
    final TextEditingController _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start, 
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage(imageURL),
            ),
            const SizedBox(width: 10), 
            Text(
              name,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.video_call_outlined,
            size: 33,
          ),
          SizedBox(width: 12),
          Icon(
            Icons.call,
            size: 33,
          ),
          SizedBox(width: 12),
          Icon(
            Icons.more_vert,
            size: 33,
          ),
        ],
      ),
      body:SingleChildScrollView(
        padding:const EdgeInsets.symmetric(vertical: 70),
         child: Column(
          
          children: messages.map((msg) {
            return ChatReplay(
              message: msg["message"],
              isReply: msg["isReply"],
            );
          }).toList(),
        ),
      ),
 
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(right: 10, left: 5),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Message",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  prefixIcon: const Icon(Icons.emoji_emotions_outlined),
                  suffixIcon: const SizedBox(
                    width: 80, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.attach_file),
                        SizedBox(width: 10),
                        Icon(Icons.camera_alt_outlined),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Icon(
              Icons.mic_none_outlined,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}
