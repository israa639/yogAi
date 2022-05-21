import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../data/models/Rounds_model.dart';


class Custom_round_widget extends StatelessWidget {

  final Round round;


  Custom_round_widget(this.round);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {},
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
        height: 200,
        width: 300,
        decoration: BoxDecoration(

            borderRadius: BorderRadius.all(Radius.circular(20.0)),

            color: Colors.blue.shade100,
            boxShadow: [ BoxShadow(color: Colors.grey, blurRadius: 10.0),]
        ),
      ),
      Row(
      children: <Widget>[


    FutureBuilder(future:round.round_specs.round_img_url,
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


    SizedBox(width: 20,),
    Container(child: Text(
    round.round_specs.round_name,
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    ),

    ),),
    SizedBox(width: 40,),


    ],

    ),

    ],
    ),
    SizedBox(height: 20,)
    ,
    ]
    )
    //)

    );
  }
}