import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoga_ai/Bloc/login_bloc/login_bloc.dart';
import 'package:yoga_ai/data/repositories/auth_repository.dart';
import 'package:yoga_ai/presentation/DBicons.dart';
import 'package:yoga_ai/presentation/screens/bottom_nav_bar_screen.dart';
import 'package:yoga_ai/presentation/screens/login_screen.dart';
import 'package:yoga_ai/presentation/screens/poses_screen.dart';
import 'package:yoga_ai/presentation/screens/registeration_screen.dart';

import 'Bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'Bloc/signUp_bloc/signup_bloc.dart';
import 'data/repositories/poses_repository.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
        await Firebase.initializeApp();

runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider(
        create: (context) => poses_repository()),
      RepositoryProvider(
          create: (context) => AuthRepository())
      ,],

        child: MultiBlocProvider(
        providers: [BlocProvider<BottomNavBarBloc>(create: (context) => BottomNavBarBloc(posesRepository: poses_repository())),

    BlocProvider<SignupBloc>(create: (_) => SignupBloc(authRepository:AuthRepository())),
          BlocProvider<LoginBloc>(create: (_) => LoginBloc(authRepository:AuthRepository())),


    ],


    child: MaterialApp(

      home: loginScreen(),  //MyHomePage(),
      routes:{

        'home':(context)=>BottomNavBarScreen(),

      },

    ),),);














  }
}

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
  Container makeContainer(AlignmentGeometry a,String text,double fontSize,Color c){
  return Container(
  alignment:a,
  child: Text(text,
  style: TextStyle(fontSize: fontSize,color: c),
  ),);}
  BottomNavigationBarItem makeNavigationButton(String Btnlabel,IconData icon1)
  {
    return  BottomNavigationBarItem(
      icon:Icon( icon1),
      label: Btnlabel,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:
//Icon(DBIcons.logo),
        Column(children:<Widget>[
          SizedBox(height: 50,),
          Container(
            alignment: Alignment.center,
            height: 40,
            child: Icon(DBIcons.logo),

          ),
          makeContainer(Alignment.center,'YogAi',20,Colors.blue),

         Row(children:<Widget>[
           makeContainer(Alignment.centerLeft,' Hi,',40,Colors.black),
           makeContainer(Alignment.centerLeft,userName,40, Colors.redAccent.shade200),
         ]),
          makeContainer(Alignment.centerLeft,'   beginner Level',20, Colors.black),
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
        ],),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.redAccent,
        currentIndex: currentIndx,
        onTap: (index) =>setState(() => currentIndx =index),
        selectedItemColor: Colors.white
        ,
        items: [
          makeNavigationButton('home',Icons.home),
          makeNavigationButton('poses',DBIcons.logo),
          makeNavigationButton('profile',Icons.person),






        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

