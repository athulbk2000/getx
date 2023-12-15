
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/controller.dart';
import 'package:getx/model/model.dart';
import 'package:getx/view/adduser.dart';
import 'package:getx/view/theme.dart';
import 'package:getx/view/update.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Box<studentmodel> todobox;
  late todomodelcontroller controller;  

  @override
  void initState() {
    todobox = Hive.box<studentmodel>('schoolstudent');
    controller = Get.put(todomodelcontroller());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("todo"),
        leading: GestureDetector(
          onTap: (){
            Get.to(()=>ThemeSwitcher());
          },
          child: Icon(Icons.settings),
        ),
      ),
      body: StreamBuilder(
        stream:todobox.watch() ,
        builder: (context, snapshot) {
          if (todobox.isEmpty) {
            return Center(
              child: Text("Enter student details"),
            );
          }
          return ListView.builder(
            itemCount: todobox.length,
            itemBuilder: (context, index) {
              studentmodel newTodo = todobox.getAt(index)!; 
              return Card(
                child: ListTile(
                  title: Text(newTodo.name),
                  subtitle: Column(
                    children: [
                      Text(newTodo.rollnumber),
                      Text(newTodo.phone),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Update(
                            name: newTodo.name,
                            rollnumber: newTodo.rollnumber,
                            phone: newTodo.phone,
                            index: index,
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.edit),
                  ),
                  leading: IconButton(
                    onPressed: () {
                      controller.deletenotes(index) .then(
                            (value) => ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${newTodo.name}...deleted'),
                              ),
                            ),
                          );
                    },
                    icon: Icon(Icons.delete),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(adduser());
        },
        child: Icon(Icons.add),
      ),
      
    );
  }
}
