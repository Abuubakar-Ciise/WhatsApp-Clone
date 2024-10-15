import 'package:flutter/material.dart';

class ChatReplay extends StatelessWidget {
  final String message;
  final bool isReply;

  const ChatReplay({
    super.key,
    required this.message,
    this.isReply = false, 
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isReply ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isReply ? Colors.blue[200] : Colors.grey[200], 
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[400]!), 
        ),
        
        child: Text(
          message,
          style: TextStyle(
            fontSize: 14,
            color: isReply ? Colors.black : Colors.black87, 
          ),
        ),
      ),
    );
  }
}