
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_ai/data/models/pose.dart';
import 'package:yoga_ai/presentation/Custom_widgets/poses_card_widget.dart';

import '../DBicons.dart';

class Poses_screen extends StatefulWidget {



  @override
  State<Poses_screen> createState() => _Poses_screenState();
}
class _Poses_screenState extends State<Poses_screen> {



  @override
  Widget build(BuildContext context) {
    List<pose> poses=[new pose(pose_id:"hhhh", pose_name:"arms", pose_category:"leg"),new pose(pose_id:"hhhh", pose_name:"leg", pose_category:"leg")];
    return Scaffold(

      body:/*ListTile(
        leading:*/

      //)
     ListView.builder(
        itemCount: poses.length,
        itemBuilder: (contex, index) => Custom_pose_Card(
          Pose:poses[index],

        ),

      ),





    );
  }
}

