
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:yoga_ai/data/models/pose.dart';
import 'package:image_downloader/image_downloader.dart';
class Custom_pose_widget extends StatefulWidget {

  final Pose pose;

  Custom_pose_widget({required this.pose});

  @override
  State<Custom_pose_widget> createState() => _Custom_pose_widgetState(pose:pose);
}
class _Custom_pose_widgetState extends State<Custom_pose_widget> {

//class Custom_pose_widget extends StatelessWidget {
  final Pose pose;
  _Custom_pose_widgetState({required this.pose}) : super();


  @override
  Widget build(BuildContext context)  {
        String? imgurl;
     loadImage(pose.pose_img_url);
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
        Text(imgurl??"no"),
      SvgPicture.network(imgurl??"no"),



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
                      /*SvgPicture.asset(
                          "lib/presentation/Characters/Chest.svg",
                          // color: Colors.white,
                          height: 100,
                          width: 80,
                        ),*/
                      ]),
                  SizedBox(width: 20,),
                  Text(
                    pose.pose_name,
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
  Future<void> loadImage(String img_url)async {
//select image url
  try{
    Reference  ref = FirebaseStorage.instance.ref().child(img_url);

    //get image url from firebase storage
    final String url =await  ref.getDownloadURL();

   setState()
    {
      img_url:url;
    }

   }
      catch(e){
    throw Exception(e.toString());
      }

  }
}