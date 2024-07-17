import 'package:flutter/material.dart';

class TaskRow extends StatefulWidget {
  const TaskRow({Key? key}) : super(key: key);

  @override
  _TaskRowState createState() => _TaskRowState();
}

class _TaskRowState extends State<TaskRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text('Task'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text('12/12/1212'),
            ),
          ],
        ),
      ),
    );
  }
}
