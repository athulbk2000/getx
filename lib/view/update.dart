import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/controller.dart';
import 'package:getx/model/model.dart';
import 'package:hive/hive.dart';

class Update extends StatefulWidget {
  final String name;
  final String rollnumber;
  final String phone;
  final int index;
Update({
  required this.name,
  required this.rollnumber,
  required this.phone,
  required this.index
});

@override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final namecontroller=TextEditingController();
  final rollnumbercontroller=TextEditingController();
  final phonecontroller=TextEditingController();  
  final controller=Get.put(todomodelcontroller());
  late Box<studentmodel>todobox;
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todobox=Hive.box<studentmodel>('schoolstudent');
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("update"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: namecontroller..text=widget.name,
             decoration: InputDecoration(
                labelText: 'Text',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),)),
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: rollnumbercontroller..text=widget.rollnumber,
             decoration: InputDecoration(
                labelText: 'Text',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),)),
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: phonecontroller..text=widget.phone,
            decoration: InputDecoration(
                labelText: 'Text',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),)),
          ),
          ElevatedButton(onPressed: (){
            final name=namecontroller.text;
            final rollnumber=rollnumbercontroller.text;
            final phone=phonecontroller.text;
            studentmodel edit=studentmodel(name: name, rollnumber: rollnumber, phone: phone);
            todobox.putAt(widget.index,edit );
            Navigator.pop(context);
           
          }, child: Text("update"))
        ],
      ),
    );
  }
}