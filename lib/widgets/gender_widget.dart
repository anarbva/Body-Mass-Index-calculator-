import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderWidget extends StatelessWidget {
   final BuildContext context;
  final  IconData icon;
  final String text; 
  final Color color;
  final VoidCallback onTap;

  const GenderWidget({
  required this.icon,
  required this.color,
  required this.context,
  required this.text,
  required this.onTap,
  super.key});
  
 

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
         height: double.infinity,
         width: 160,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(icon,
              size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top:18.0),
                child: Text(text.toUpperCase(),
                style:const TextStyle(
                                     fontSize: 20,
                                     fontWeight: FontWeight.bold,
                                   ),),
              ),
            ],
          ),
          
          ),
      ),
    );
  }
}