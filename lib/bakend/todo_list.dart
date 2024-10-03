import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final VoidCallback deleteFunction;

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: screen.width * 0.20,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              side: const BorderSide(color: Colors.black),
            ),
            SizedBox(
              width: screen.width * 0.560,
              child: Text(
                taskName,
                style: TextStyle(
                    overflow: TextOverflow.clip,
                    color: Colors.black,
                    fontSize: 20,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: 3,
                    decorationColor: Colors.black),
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: deleteFunction,
            ),
          ],
        ),
      ),
    );
  }
}
