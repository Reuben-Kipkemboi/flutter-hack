import 'package:flutter/material.dart';
import 'package:to_do_app/screens/home_page.dart'; 


void main() {
 runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key});
  

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      

      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
        // Removing useMaterial3 as it's not necessary
      ),
      // home: const MyHomePage(title: 'To Do Application'),
      home: const MyHomePage(title: 'To Do Application'),
    );
  }
}

