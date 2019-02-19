import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todos_flutter/home/todos_model.dart';

List<Widget> footerWidgets(TodosModel todos) {
  List<Widget> widgets = [];

  widgets.add(Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(left: 10),
    child: Text('${todos.remaining}'),
    height: 30,
  ));

  var filters = FilterWords.values.map((FilterWords words) {
    String word = words.toString().replaceFirst('FilterWords.', '');
    return ButtonTheme(
      minWidth: 0,
      height: 30,
      child: OutlineButton(
        borderSide: BorderSide(
          color: todos.filterWords == words ? Color(0x33af2f2f) : Colors.transparent
        ),
        textColor: Color(0xff777777),
        child: Text(word.trim()),
        onPressed: () {
          todos.filterWords = words;
        },
      ),
    );
  });

  widgets.add(Row(
    children: filters.toList(),
  ));

  widgets.add(ButtonTheme(
    minWidth: 40,
    height: 30,
    child: FlatButton(
      child: Text('Clear'),
      textColor: Color(0xff777777),
      onPressed: () {
        todos.clearCompleted();
      },
    ),
  ));

  return widgets;
}

class TodoFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Color(0xff777777),
      ),
      child: ScopedModelDescendant<TodosModel>(
        builder: (BuildContext context, Widget child, TodosModel todos) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: footerWidgets(todos),
          );
        },
      ),
    );
  }
}
