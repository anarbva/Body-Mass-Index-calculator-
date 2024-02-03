
import 'package:bmi/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       useMaterial3:true,
       scaffoldBackgroundColor:const Color(0xff1D2136) ,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 114, 147, 174),
          primary: const Color(0xFF8D9AE0),
        
        brightness: Brightness.dark),
        textTheme:  TextTheme(
          displayLarge:const  TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.oswald(
            fontSize: 20,
            fontStyle: FontStyle.italic
            ),
          bodyMedium: GoogleFonts.merriweather(
          ),
          

        ),
        
      
      ),
      home:  HomeScreen(),
      );
  }
}

