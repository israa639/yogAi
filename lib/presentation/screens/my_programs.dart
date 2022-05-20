
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_ai/data/models/pose.dart';
import 'package:yoga_ai/presentation/Custom_widgets/poses_card_widget.dart';

import '../../Bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import '../DBicons.dart';

class myPrograms_screen extends StatefulWidget {



  myPrograms_screen();

  @override
  State<myPrograms_screen> createState() => _myPrograms_screenState();
}
class _myPrograms_screenState extends State<myPrograms_screen> {




  _myPrograms_screenState();

  @override
  Widget build(BuildContext context) {
    // final _Bottom_nav_bar_Bloc=BlocProvider.of<BottomNavBarBloc>(context);

    return Scaffold(

        body: Column(
        children:<Widget>[
          SizedBox(height: 50,),
         Container(
           alignment: Alignment.topLeft,
          child:Text(
            " MY Programs",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),

          ),),
          SizedBox(height: 30,),
        Container(
         child:Stack(
            children:<Widget> [

              Container(
                height: 200,
                width:395,
                decoration: BoxDecoration(

                    borderRadius:BorderRadius.all(Radius.circular(20.0)),

                    color: Colors.blue.shade50,
                    boxShadow:[ BoxShadow(color: Colors.grey,blurRadius: 10.0),]
                ),
              ),
              Row(
                children: <Widget>[
              ElevatedButton(
                child: const Icon(Icons.add),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary:Colors.black, // set the background color


                ),
                  // animationDuration:Duration(milliseconds: 1000),

                ),


                  SvgPicture.asset(
                    "Assets/44.svg",
                   // color: Colors.redAccent,
                    height: 100,
                    width: 100,
                  ),


            SvgPicture.asset(
              "Assets/6.svg",
             // color: Colors.white,
              height: 200,
              width: 80,
            ),

                      ]),







            ],
          ),


        ),

      /*  ListView.builder(
          itemCount: (this._poses.length),
          itemBuilder: (contex, index) =>
              Custom_pose_widget(pose:this._poses[index]),
        )*/
        ]
    ,)
    );
  }

}

