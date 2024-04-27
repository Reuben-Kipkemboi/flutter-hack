import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/models/task.dart';
import '../models/todo_item.dart';
import '../models/todo_list.dart';
import '../models/todo_item.dart';
import '../utils/loop_todoCards.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TodoItem> todoList = []; // Define todoList here

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMMd().format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: GoogleFonts.elMessiri().fontFamily,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              setState(() {
                todoList.removeWhere((todo) => todo.checked);
              });
            },
            icon: Icon(Icons.delete, color: Colors.red),
            label: Text('Clear Done', style: TextStyle(color: Colors.black)),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
          ),
          SizedBox(width: 10),
          TextButton.icon(
            onPressed: () {
              setState(() {
                todoList.clear();
              });
            },
            icon: Icon(Icons.clear_all, color: Colors.red),
            label: Text('Clear All', style: TextStyle(color: Colors.black)),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
          ),
        ],
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Welcome to your To Do App!',
                      style: TextStyle(
                        fontFamily: GoogleFonts.elMessiri().fontFamily,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 216, 108, 19),
                      ),
                    ),
                    Text(
                      'Date: $formattedDate',
                      style: TextStyle(
                        fontFamily: GoogleFonts.elMessiri().fontFamily,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 216, 108, 19),
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: todoList.map((todo) {
                        return Card(
                          color: todo.checked
                              ? Colors.orange
                              : Colors
                                  .white, // Set card background color based on completion status
                          child: CheckboxListTile(
                            title: Text(
                              todo.text,
                              style: TextStyle(
                                fontFamily: GoogleFonts.elMessiri().fontFamily,
                                color: Colors.black,
                                decoration: todo.checked
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            value: todo.checked,
                            onChanged: (bool? value) {
                              setState(() {
                                todo.checked = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            checkColor: Colors.white,
                            activeColor: Colors.black, // Checkbox outline color
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoDialog(context);
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddTodoDialog(BuildContext context) async {
    String newTodoText = "";

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "New Todo",
            style: TextStyle(
                fontFamily: GoogleFonts.elMessiri()
                    .fontFamily), // Apply elMessiri font here
          ),
          content: TextField(
            autofocus: true,
            onChanged: (value) {
              newTodoText = value;
            },
            decoration: const InputDecoration(labelText: "Todo text"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                    fontFamily: GoogleFonts.elMessiri()
                        .fontFamily), // Apply elMessiri font here
              ),
            ),
            TextButton(
              onPressed: () {
                final newTodoItem = TodoItem(checked: false, text: newTodoText);
                addTodoItem(newTodoItem); // Call addTodoItem here
                Navigator.pop(context); // Close the dialog
              },
              child: Text(
                "Add",
                style: TextStyle(
                    fontFamily: GoogleFonts.elMessiri()
                        .fontFamily), // Apply elMessiri font here
              ),
            ),
          ],
        );
      },
    );
  }

  // Define the function to add todo item
  void addTodoItem(TodoItem todoItem) {
    setState(() {
      todoList.add(todoItem);
    });
  }
}
