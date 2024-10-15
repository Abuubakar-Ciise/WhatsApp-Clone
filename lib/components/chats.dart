import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/userInfo.dart';

class CustomChats extends StatelessWidget {
  final String imageURL;
  final String name;
  final String? role;
  final String message;
  final String time; 

  const CustomChats({
    super.key,
    required this.imageURL,
    required this.name,
    this.role,
    required this.message, 
    required this.time, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserInfoScreen(
              imageURL: imageURL,
              name: name,
              role: role,
              message: message,
              time: time,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 0.0),
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        height: 70,
        decoration: BoxDecoration(
         
          borderRadius: BorderRadius.circular(8), 
          
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(6),
              width: 55,
              height: 55,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(imageURL),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5),
                      ),
                      const Spacer(),
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
