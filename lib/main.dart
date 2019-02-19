import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todos_flutter/home/todos.dart';
import 'package:todos_flutter/home/todos_model.dart';

void main() => runApp(ScopedModel(
  model: TodosModel(),
  child: MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Todos(),
    );
  }
}