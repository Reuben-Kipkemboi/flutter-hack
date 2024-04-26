import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';


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
      home: const MyHomePage(title: 'To Do Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMMd().format(DateTime.now());
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title,
      style: TextStyle(
      fontFamily: GoogleFonts.elMessiri().fontFamily,
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  ),
),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/todo.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome to your To Do App!',
                  style: TextStyle(
                    fontFamily: GoogleFonts.elMessiri().fontFamily,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 216, 108, 19)              ),
                                ),
                Text(
                  'Date: $formattedDate',
                  style: TextStyle(
                    fontFamily: GoogleFonts.elMessiri().fontFamily,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 216, 108, 19)              ),
                                ),
                SizedBox(height: 20),
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
