import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Pose {

 final  String pose_name;
 String pose_img_url;
 late final pose_time;

  Pose({required this.pose_name,required this.pose_img_url,this.pose_time});
//in case of future adding of more poses
  Map<String, dynamic> toDocument() {

   return {

    "pose_img_url":this.pose_img_url,
    "pose_name":this.pose_name,
     "pose_time":this.pose_time


   };
  }

  factory Pose.fromSnapshot( DocumentSnapshot<Map<String, dynamic>> snap) {

   return Pose(

pose_img_url: snap[ "pose_img_url"],
    pose_name: snap["pose_name"],
       pose_time:snap["pose_time"],
   );
  }










}