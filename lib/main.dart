import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: "Todo",
    home: ToDoApp(),
  ));
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({ Key? key }) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  late String textinlistview;
  late List<String> todolist=[];
  addtodo(String things){
    setState(() {
      todolist.add(things);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To Do App"),),
      body: 
        
        Column(
          children: [
            TextFormField(
              onChanged: (val){
                textinlistview=val;
              },
            ),
            
            Expanded(
              child: ListView.builder(
              itemCount: todolist.length ,
              itemBuilder:  (context, index) {
              return ListTile(
                title: Text('${todolist[index]}'),
              );
                  }),
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(onPressed: (){
          addtodo(textinlistview);
        })
      
    );
  }
}