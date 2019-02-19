import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:todos_flutter/home/todos_model.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ScopedModelDescendant<TodosModel>(
          builder: (BuildContext context, Widget child, TodosModel todosStore) {
            var todos = todosStore.filterTodos;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (ctx, index) {
                Todo todo = todos[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: .5, color: Colors.blueGrey[200]))
                  ),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        onChanged: (val) {
                          todosStore.changeChecked(val, todos[index]);
                        },
                        value: todo.checked,
                      ),
                      Expanded(
                        child: Text(
                          todo.title,
                          style: TextStyle(
                            color:
                                todo.checked ? Color(0xffd9d9d9) : Colors.black,
                            decoration: todo.checked
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Color(0xffcc9a9a),
                            size: 20,
                          ),
                          onPressed: () {
                            todosStore.removeItem(todo);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
