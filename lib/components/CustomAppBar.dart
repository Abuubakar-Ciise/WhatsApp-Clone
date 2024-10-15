import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget  implements PreferredSizeWidget  {
  final String title;
  final List<Widget>? actions;
  final Color? titleColor;
  const CustomAppBar({super.key, required this.title ,  this.actions = const[] ,this.titleColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color:titleColor ),
        ),
      
      actions: actions,
      backgroundColor: Colors.white,
    );
  }
  @override
 Size get preferredSize => const Size.fromHeight(kToolbarHeight); 
}
