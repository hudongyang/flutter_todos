import 'package:flutter/material.dart';
import 'dart:math';
import 'package:scoped_model/scoped_model.dart';

import 'todos_model.dart';
import 'package:todos_flutter/colors.dart';

class TodoHeader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodoState();
  }
}

class _TodoState extends State<TodoHeader> {
  var _controller = TextEditingController();
  bool checked = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: background,
          border: Border(bottom: BorderSide(width: .4, color: Colors.black12)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color.fromARGB(3, 0, 0, 0),
              offset: Offset(0, -2),
              blurRadius: 1,
            ),
          ]),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Transform(
              child: GestureDetector(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: checked ? arrow_down_selected : Color(0xffe6e6e6),
                ),
                onTap: () {
                  setState(() {
                    checked = !checked;
                    TodosModel todos = ScopedModel.of<TodosModel>(context);
                    todos.toggleAll(checked);
                  });
                },
              ),
              transform: Matrix4.identity()
                ..rotateZ(-pi / 2)
                ..scale(.8),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'What needs to be done?',
                  hintStyle: TextStyle(color: Color(0x554d4d4d)),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.all(5),
                ),
                controller: _controller,
                textInputAction: TextInputAction.go,
                onSubmitted: (String val) {
                  if (val.trim() == '') {
                    return;
                  }

                  Todo todo = Todo(val);
                  TodosModel todos = ScopedModel.of<TodosModel>(context);
                  todos.add(todo);

                  _controller.clear();
                },
              ),
              margin: EdgeInsets.symmetric(horizontal: 15),
            ),
          ),
        ],
      ),
    );
  }
}
