import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  
  const CustomAppBar({
    required this.title,
    required this.height,
    super.key});

  @override
  Size get preferredSize => Size.fromHeight(height);
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}


class _CustomAppBarState extends State<CustomAppBar>  {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 1,
      title: Center(
        child: Text(widget.title,
          style:const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}