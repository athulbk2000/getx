import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/controller.dart';
import 'package:getx/model/model.dart';
import 'package:hive/hive.dart';

class adduser extends StatefulWidget {
  const adduser({super.key});

  @override
  State<adduser> createState() => _adduserState();
}

class _adduserState extends State<adduser> {
  final namecontroller=TextEditingController();
  final rollnumbercontroller=TextEditingController();
  final phonecontroller=TextEditingController();
  late Box<studentmodel>todobox;  
  late todomodelcontroller controller;
  @override
void initState() {
   todobox=Hive.box<studentmodel>('schoolstudent');
   controller=Get.put(todomodelcontroller());
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              children: [
                TextFormField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                    labelText: 'enter name',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                  ),
                ),
                SizedBox(height: 10,),
                 TextFormField(
                  controller: rollnumbercontroller,
                  decoration: InputDecoration(
                    labelText: 'enter rollnumber',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                  ),
                ),
                SizedBox(height: 10,),
                 TextFormField(
                  controller: phonecontroller,
                  decoration: InputDecoration(
                    labelText: 'enter phone number',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                  ),
                ),
                ElevatedButton(onPressed: (){
                  final name=namecontroller.text;
                  final rollnumber=rollnumbercontroller.text;
                  final phone=phonecontroller.text;
                  controller.addnotes(name, rollnumber, phone);
                  Navigator.pop(context);
                }, child: Text("saved"))
              ],
              
          ),
        ),
      ),

    );
  }
}