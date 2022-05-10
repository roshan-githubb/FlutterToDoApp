import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: "Todo",
    debugShowCheckedModeBanner: false,
    home: ToDoApp(),
  ));
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  late String textinlistview;
  late List<String> todolist = [];
  addtodo(String things) {
    setState(() {
      todolist.add(things);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("To Do App"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                onChanged: (val) {
                  textinlistview = val;
                }, decoration: InputDecoration(
                  
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: todolist.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${todolist[index]}'),
                    );
                  }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addtodo(textinlistview);
          },
          child: Icon(Icons.add),
        ));
  }
}
