import 'package:get/get.dart';
import 'package:getx/model/model.dart';
import 'package:hive/hive.dart';
class todomodelcontroller extends GetxController{
   static final todobox=Hive.box<studentmodel>('schoolstudent');
addnotes(
  String name,
  String rollnumber,
  String phone,
){
  studentmodel todoapp=studentmodel(name: name, rollnumber: rollnumber, phone: phone);
  todobox.add(todoapp);
}
deletenotes(int index)async{
  await todobox.deleteAt(index);
}
updatenotes(int index,String name,String rollnumber,String phone){
  studentmodel todoapp=studentmodel(name: name, rollnumber: rollnumber, phone: phone);
  todobox.putAt(index, todoapp);
}
}
