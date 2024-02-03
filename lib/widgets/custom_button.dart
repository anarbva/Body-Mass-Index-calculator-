
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomButton({
    required this.onPressed,
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
  return  ElevatedButton(
                              onPressed: onPressed,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    foregroundColor: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    shape:const  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.zero),
                                      
                                     ),
                                    minimumSize: Size(
                                      MediaQuery.of(context).size.width,80
                                    ),
                                  ),
                                  child: Text(text.toUpperCase(),
                                  style: const TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                  );
  }
}