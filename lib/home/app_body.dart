import 'package:flutter/material.dart';
import 'package:todos_flutter/home/header.dart';
import 'package:todos_flutter/home/todo_list.dart';
import 'package:todos_flutter/home/footer.dart';

class TodoApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            TodoHeader(),
            TodoList(),
            TodoFooter(),
          ],
        ),
      ),
    );
  }
}
