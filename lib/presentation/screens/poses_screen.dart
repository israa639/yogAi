
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_ai/data/models/pose.dart';
import 'package:yoga_ai/presentation/Custom_widgets/poses_card_widget.dart';

import '../../Bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import '../DBicons.dart';

class Poses_screen extends StatefulWidget {

final List<Pose>poses;
bool  checkBox_appear;

Poses_screen(this.poses,this.checkBox_appear);

  @override
  State<Poses_screen> createState() => _Poses_screenState(poses,checkBox_appear);
}
class _Poses_screenState extends State<Poses_screen> {

 final List<Pose> _poses;
bool  checkBox_appear;

_Poses_screenState(this._poses,this.checkBox_appear);

  @override
  Widget build(BuildContext context) {
   // final _Bottom_nav_bar_Bloc=BlocProvider.of<BottomNavBarBloc>(context);
   List<String>_selectedIndex=[];
   int x=0;
    return Scaffold(

      body: ListView.builder(

        itemCount: (this._poses.length),

        itemBuilder: (contex, index) =>
            Custom_pose_widget(pose:this._poses[index],selectedIndex:_selectedIndex ,checkBox_appear:checkBox_appear,),

      )

    );
  }

}

