import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:yoga_ai/data/models/pose.dart';

class Custom_pose_widget extends StatefulWidget {

  final Pose pose;
  bool checkBox_appear;
  List<String> selectedIndex;

  Custom_pose_widget({required this.pose,required this.selectedIndex,required this.checkBox_appear});

  @override
  State<Custom_pose_widget> createState() => _Custom_pose_widgetState(pose:pose,selectedIndex: selectedIndex,checkBox_appear:checkBox_appear );
}
class _Custom_pose_widgetState extends State<Custom_pose_widget> {
bool? value=false;
bool checkBox_appear;
  final Pose pose;
  List<String> selectedIndex;
  _Custom_pose_widgetState({required this.pose,required this.selectedIndex,required this.checkBox_appear}) : super();


  @override
  Widget build(BuildContext context)  {

    return InkWell(
        onLongPress: (){
        },
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
                width:380,
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
                        FutureBuilder(future:pose.pose_Storage_url,
                            builder: (context,snapshot){
                              if(snapshot.connectionState==ConnectionState.done)
                              { if (snapshot.hasData) {
                                return Container(
                                  width: 130,
                                  height: 100,
                                  child: SvgPicture.network(snapshot.data.toString()),
                                );}

                              }return Container();

                            }),

                      ]),
                  SizedBox(width: 20,),
                  Container(child: Text(
                    pose.pose_name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),

                  ),),
                  SizedBox(width: 40,),



                ],

              ),
              checkbox(checkBox_appear),

            ],
          ),
    SizedBox(height: 20,),])
    //)

    );
  }
Widget checkbox(bool value_check)
{
  if(value_check==true)
    {
     return Checkbox(value: this.value, onChanged:(newvalue){
        setState((){  this.value= newvalue;});
        if(newvalue==true&&!selectedIndex.contains(pose.pose_name))
        { this.selectedIndex.add(pose.pose_name);
        }
        else if(newvalue==false&&selectedIndex.contains(pose.pose_name))
        {
          selectedIndex.remove(pose.pose_name);
        }

      });
    }
return Container();
}
}