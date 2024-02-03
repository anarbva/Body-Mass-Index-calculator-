
import 'package:bmi/app_constants/colors/app_colors.dart';
import 'package:bmi/helpers/app_enums.dart';
import 'package:bmi/models/client_home_model.dart';
import 'package:bmi/providers/home_screen.provider.dart';
import 'package:bmi/screens/result_screen.dart';
import 'package:bmi/services/bmi_servces.dart';
import 'package:bmi/widgets/custom_age_weight.dart';
import 'package:bmi/widgets/custom_app_bar.dart';
import 'package:bmi/widgets/custom_button.dart';
import 'package:bmi/widgets/gender_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends ConsumerWidget {

 HomeScreen({super.key});

final _bmiServices = BmiServices();

  @override
  Widget build(BuildContext context, WidgetRef ref ) {
   final clientHomeModel= ref.watch(homeScreenNotifierProvider);
   final homeScreenNotifier= ref.watch(homeScreenNotifierProvider.notifier);
    return Scaffold(
      appBar:const CustomAppBar(
        title: 'Bmi Calculator',
         height: 60,
         ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 18.0 ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,      
                          children: [
                              GenderWidget(
                              onTap:() =>homeScreenNotifier.changeGender(Gender.male),
                              context: context, 
                              icon:FontAwesomeIcons.mars, 
                              text: "Male".toUpperCase(),
                               color: clientHomeModel.gender==Gender.male
                               ? AppColors.activeColor
                               :AppColors.inActiveColor 
                               ),
                               
                              const SizedBox(width: 22.0),
                             GenderWidget(
                              onTap:() =>homeScreenNotifier.changeGender(Gender.female),
                              context: context,
                               icon:FontAwesomeIcons.venus,
                                text: "Female".toUpperCase(),
                               color: clientHomeModel.gender == Gender.female
                               ? AppColors.activeColor
                               : AppColors.inActiveColor,
                               
                                ),  
                               
                          ],
                        ),
                      ),
                    
                      const SizedBox(height: 22.0),
                           
                            _buildSlider(context:context,
                            clientHomeModel: clientHomeModel,
                            homeScreenNotifier: homeScreenNotifier,
                            ),
                       const SizedBox(height: 22.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomAgeWeight(
                              text: "Weight",
                              number: clientHomeModel.weight.toString(),
                              increment:()=>homeScreenNotifier.incrementWeight(),
                              decrement: ()=>homeScreenNotifier.decrementWeight(),
                            ),
                            const SizedBox(width: 22),
                                 CustomAgeWeight(
                              text:"age",
                              number: clientHomeModel.age.toString(),
                              increment:()=> homeScreenNotifier.incrementAge(),
                              decrement: ()=> homeScreenNotifier.decrementAge(),
                              
                            ),
                          ],
                        ), 
                        const SizedBox(height: 22.0), 
                               
                    ],
                    
                  ),
                ),
              ),
                 CustomButton(
                  onPressed: (){
                               Navigator.of(context).push(
                               MaterialPageRoute(builder: (context)=>
                               ResultScreen(data:_bmiServices.calculate(clientHomeModel.weight, clientHomeModel.height),
                               description: _bmiServices.getInterpretation(clientHomeModel.weight,clientHomeModel.height),
                               result: _bmiServices.getResultText(clientHomeModel.weight,clientHomeModel.height),)),
                                      );
                                    } ,
                   text:'Calculate',
                   ),   
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlider({
   required BuildContext context,
   required ClientHomeModel clientHomeModel,
   required HomeScreenNotifier homeScreenNotifier,
    }) {
    return Container(
                               height: 200,
                            decoration: BoxDecoration(
                             color: AppColors.activeColor,
                             borderRadius: BorderRadius.circular(10),
                            ),
                            padding:const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Text("height".toUpperCase(),
                                style:const  TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ), ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(clientHomeModel.height.round().toString().toUpperCase(),
                                    style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                 const   SizedBox(width: 5,),
                                  const  Text("cm"),
                                  ],
                                ),
                                SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: Colors.red,
                                    trackShape:const  RectangularSliderTrackShape(
                                    ),
                                    trackHeight: 3.0,
                                    thumbColor: Colors.red,
                                    thumbShape:const  RoundSliderThumbShape(
                                      enabledThumbRadius: 8.0,
                                      
                                    ),
                                    overlayColor: Colors.red.withOpacity(0.1),
                                    overlayShape:const  RoundSliderOverlayShape(
                                      overlayRadius: 20.0
                                    ),
                                  ),
                                   child: 
                                 Slider(
                                activeColor: Colors.red,
                                thumbColor: Colors.redAccent,
                                      value: clientHomeModel.height,
                                      max: 220,
                                      min: 50,
                                      divisions: 5,
                                      
                                      onChanged: (double value)=>homeScreenNotifier.changeHeight(value),
                                    ),
                                ),
                              ],
                            ),
                          );
  }

}

