import 'package:cloud_firestore/cloud_firestore.dart';

import '../../enum/user_level_enum.dart';

class user{
 final  String user_name;
 String? level;
  final DateTime age;
  String? user_id;


  user({required this.user_name,this.level,required this.age, this.user_id});

 Map<String, dynamic> toDocument() {
  return {
   "age":this.age,
   "user_name":this.user_name,
   "level":Level.beginner.toString(),
   "user_id":this.user_id,
  };
 }

 factory user.fromSnapshot( DocumentSnapshot<Map<String, dynamic>> snap) {

  return user(
  age: DateTime.parse(snap[ "age"].toDate().toString()),
   user_name: snap["user_name"],
   level:snap["level"],
   user_id:snap["user_id"],

  );
 }










}