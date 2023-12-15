import 'package:hive/hive.dart';

part 'model.g.dart';
@HiveType(typeId: 1)
class studentmodel{
  @HiveField(0)
  String name;
  @HiveField(1)
  String rollnumber;
  @HiveField(2)
  String phone;
  studentmodel({
    required this.name,required this.rollnumber,required this.phone
  });

}