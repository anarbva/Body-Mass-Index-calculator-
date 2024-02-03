import 'package:bmi/widgets/custom_app_bar.dart';
import 'package:bmi/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String result;
  final String description;
  final double data;

  const ResultScreen({super.key,
  required this.result,required this.description,  required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CustomAppBar(
        title: 'Results',
         height: 60,
         ),
      body: Center(
        child: Column(
          
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(result),
                  const SizedBox(height: 50),
                  Text(data.toStringAsFixed(2)),
                  const SizedBox(height: 50),
                  Text(description,
                  textAlign: TextAlign.center,),
                    
                ],
            
              ),
            ),
            CustomButton(
              onPressed: (){
                Navigator.pop(context);
              },
               text: 're-calculate',
               ),
          ],
        ),
      ),
    );
  }
}