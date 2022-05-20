import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/Home_bloc/home_bloc.dart';
import '../../Bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import '../DBicons.dart';

class MyHomeBar extends StatefulWidget {



  @override
  State<MyHomeBar> createState() => _MyHomeBarState();
}

class _MyHomeBarState extends State<MyHomeBar> {
  int currentIndx=0;

  String userName='israa!';
  Container makeProgramContainer(){
    return Container(
      height: 200,
      width:300,
      decoration: BoxDecoration(

          borderRadius:BorderRadius.all(Radius.circular(20.0)),

          color: Colors.blue.shade100,
          boxShadow:[ BoxShadow(color: Colors.grey,blurRadius: 10.0),]
      ),
    );

  }
  Widget makeTextContainer(AlignmentGeometry a,String text,double fontSize,Color c){
    return Container(
      alignment:a,
      child: Text(text,
        style: TextStyle(fontSize: fontSize,color: c),
      ),);}


  @override
  Widget build(BuildContext context) {
    final _HomeBloc = BlocProvider.of<HomeBloc>(context);

    return Scaffold(

      body:
//Icon(DBIcons.logo),
      Column(children:<Widget>[
        SizedBox(height: 50,),
        Container(
          alignment: Alignment.center,
          height: 40,
          child: Icon(DBIcons.logo,size: 50,color: Colors.red.shade300,),

        ),
        makeTextContainer(Alignment.center,'YogAi',20,Colors.blue),

        Row(children:<Widget>[
          makeTextContainer(Alignment.centerLeft,' Hi,',40,Colors.black),
          makeTextContainer(Alignment.centerLeft,_HomeBloc.current_user.user_name,40, Colors.redAccent.shade200),
        ]),
        makeTextContainer(Alignment.centerLeft,_HomeBloc.current_user.level.toString(),20, Colors.black),
        SizedBox(height: 50,),
        Container(
            height: 200,
            child:
            ListView(scrollDirection: Axis.horizontal,
              children:[
                makeProgramContainer(),
                SizedBox(width: 20,),
                makeProgramContainer(),
                SizedBox(width: 20,),
                makeProgramContainer(),
              ],)
        ),
        SizedBox(height: 50,),
        makeTextContainer(Alignment.topLeft,"Recommended Flows",30, Colors.black),
        SizedBox(height: 50,),
      ],),





      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }}