import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ToDoButton extends StatelessWidget {
  final String text;
  VoidCallback onPress;
  ToDoButton({Key? key, required this.text, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Text(text),
      color: Theme.of(context).primaryColor,
    );
  }
}
