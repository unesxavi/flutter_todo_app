import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key});

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
          children: const [
            Text(
              "task",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            Icon(
              Icons.close,
              size: 27,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
