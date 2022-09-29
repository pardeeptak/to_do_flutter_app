import 'package:flutter/material.dart';
import 'package:my_to_list/controller/to_do_controller.dart';
import 'package:my_to_list/to_do_tile.dart';
import 'package:provider/provider.dart';

import 'alert_dilog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ToDoController>(create: (_) => ToDoController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  createNewTask(BuildContext context, ToDoController controller) {
    showDialog(
        context: context,
        builder: (context) {
          return DilogBox(
            controller: controller.controller,
            onSave: controller.addNewTask(context),
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoController>(builder: (context, toDoController, child) {
      return Scaffold(
          backgroundColor: Colors.yellow[200],
          appBar: AppBar(
            title: Text("To Do List"),
            actions: [
              Checkbox(
                  activeColor: Colors.black,
                  value: toDoController.select,
                  onChanged: (value) => toDoController.selectAll(value)),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: createNewTask(context, toDoController),
            child: Icon(Icons.add),
          ),
          body: ListView.builder(
              shrinkWrap: true,
              itemCount: toDoController.toDoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  taskName: toDoController.toDoList[index][0],
                  taskCompleted: toDoController.toDoList[index][1],
                  onChanged: (value) =>
                      toDoController.checkBoxChange(value, index),
                  deleteFunction: (context) => toDoController.deleteTask(index),
                );
              }));
    });
  }
}
