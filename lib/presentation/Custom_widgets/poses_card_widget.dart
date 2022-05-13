
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'package:yoga_ai/data/models/pose.dart';

class Custom_pose_Card extends StatelessWidget {
  final pose Pose;
  Custom_pose_Card({required this.Pose}) : super();


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       /* Navigator.push(
            context,
            MaterialPageRoute(
                ));*/
      },
      child:
         // Expanded(child:
      Column(children:<Widget> [
        SizedBox(height: 20,),
          Stack(
            children:<Widget> [

              Container(
                height: 100,
                width:350,
                decoration: BoxDecoration(

                    borderRadius:BorderRadius.all(Radius.circular(20.0)),

                    color: Colors.grey.shade200,
                    boxShadow:[ BoxShadow(color: Colors.grey,blurRadius: 10.0),]
                ),
              ),
              Row(
                children: <Widget>[
                  Stack(
                      children:<Widget> [

                        Container(
                          height: 100,
                          width:150,
                          decoration: BoxDecoration(

                              borderRadius:BorderRadius.all(Radius.circular(20.0)),

                              color: Colors.deepOrange.shade50,
                              boxShadow:[ BoxShadow(color: Colors.grey,blurRadius: 10.0),]
                          ),
                        ),

                        SvgPicture.asset(
                          "lib/presentation/Characters/Chest.svg",
                          // color: Colors.white,
                          height: 100,
                          width: 80,
                        ),
                      ]),
                  SizedBox(width: 20,),
                  Text(
                    Pose.pose_name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),


            ],
          ),
    SizedBox(height: 20,),])
    //)

    );
  }
}