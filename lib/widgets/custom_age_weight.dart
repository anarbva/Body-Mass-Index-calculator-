import 'package:bmi/app_constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAgeWeight extends StatelessWidget {
  final String text;
  final String number;
  final VoidCallback increment;
  final Function() decrement;
  
  const CustomAgeWeight({
    required this.text,
    required this.number,
    required this.increment,
    required this.decrement,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  color: AppColors.activeColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  children: [
                                    Text(text.toUpperCase(),
                                     style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            ),
                                    Text(number,
                                     style:const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            onPressed: increment,
                                             style: ElevatedButton.styleFrom(
                                              backgroundColor:AppColors.activeColor ,
                                              shape: const CircleBorder(),
                                            ),
                                            child:const Padding(
                                              padding: EdgeInsets.all(3),
                                              child:Icon(FontAwesomeIcons.plus,),
                                           
                                            ),
                                           
                                             ),
                                                    
                                                         ElevatedButton(
                                            onPressed: decrement,
                                              style: ElevatedButton.styleFrom(
                                              backgroundColor:AppColors.activeColor,
                                              shape: const CircleBorder(),
                                            ), 
                                            child:const Padding(
                                              padding: EdgeInsets.all(3),
                                              child:Icon(FontAwesomeIcons.minus,), 
                                             
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