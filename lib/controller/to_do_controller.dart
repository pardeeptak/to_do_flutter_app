import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../alert_dilog.dart';

class ToDoController extends ChangeNotifier {
  List toDoList = [
    ["Task 1", false],
    ["Task 2", false],
  ];

  void checkBoxChange(bool? value, int index) {
    toDoList[index][1] = !toDoList[index][1];
    checkAll();
    notifyListeners();
  }

  void checkAll() {
    bool chek = true;
    for (var i = 0; i < toDoList.length; i++) {
      if (toDoList[i][1] == false) {
        chek = false;
        break;
      }
    }
    select = chek;
    notifyListeners();
  }

  final controller = TextEditingController();

  addNewTask(BuildContext context) {
    toDoList.add([controller.text, false]);
    controller.clear();
    checkAll();
    Navigator.of(context).pop();
    notifyListeners();
  }

  void deleteTask(int index) {
    toDoList.removeAt(index);
    checkAll();
    notifyListeners();
  }

  bool select = false;
  void selectAll(bool? value) {
    for (var i = 0; i < toDoList.length; i++) {
      if (value == true)
        toDoList[i][1] = true;
      else
        toDoList[i][1] = false;
    }
    select = value!;
    notifyListeners();
  }
}
