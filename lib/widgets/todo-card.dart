import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String taskTitle;
  final bool taskStatus;
  const TodoCard({super.key, required this.taskTitle, required this.taskStatus});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(209, 224, 224, 0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              taskTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            Icon(
              (taskStatus) ? Icons.check : Icons.close,
              size: 27,
              color: (taskStatus) ? Colors.green : Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
