import 'package:flutter/material.dart';
import 'package:todos_flutter/colors.dart';
import 'package:todos_flutter/home/app_body.dart';
import 'package:todos_flutter/home/title.dart';

class Todos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodosState();
}

class TodosState extends State<Todos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('todos'),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(color: background),
        child: Column(
          children: <Widget>[
            TodoTitle(),
            TodoApp(),
          ],
        ),
      ),
    );
  }
}
