import 'package:flutter/material.dart';

class TodoTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        'todos',
        style: TextStyle(fontSize: 50, color: Color.fromARGB(50, 175, 47, 47)),
      ),
      alignment: Alignment.center,
    );
  }
}
