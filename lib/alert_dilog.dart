import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_to_list/to_do_button.dart';

class DilogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DilogBox(
      {Key? key,
      required this.controller,
      required this.onSave,
      required this.onCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 200,
        width: double.infinity,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ToDoButton(text: "Cancel", onPress: onCancel),
                SizedBox(
                  width: 10,
                ),
                ToDoButton(text: "Add", onPress: onSave),
              ],
            )
          ],
        ),
      ),
    );
  }
}
