import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/pose.dart';
class poses_repository{
  final _firestore=FirebaseFirestore.instance;
  final _fireStorage=FirebaseStorage.instance;
    late final List<Pose> poses;
     //method to get poses data from firestore
  void setPosesUrl()
  {
    for(int i=0;i<poses.length;i++)
    {
      this.poses[i].pose_Storage_url= loadImage(poses[i].pose_img_url);
    }
  }
  Future<void> getPoses()async
  {
    final documentSnapshot =
    await _firestore.collection('poses').get();


    if (documentSnapshot.size>=0) {

      this.poses=await documentSnapshot.docs.map((doc)=>Pose.fromSnapshot(doc)).toList();

      setPosesUrl();

     // return poses;
    }
    else{
      throw Exception('failed load poses');
    }

  }
 /* Future<void> setPose(Pose pose)async
  {
  try {

    await  _firestore.collection('poses').add(pose.toDocument());

  }
  catch(e)
    {
    throw Exception('failed upload poses');
    }
  }
Future<void> addPoses()async
{ List<Pose>poses = [
  new Pose(pose_name: "boat",
      pose_img_url: "gs://yogaai-7636e.appspot.com/boat_blue.svg"),
  new Pose(pose_name: "bow",
      pose_img_url: "gs://yogaai-7636e.appspot.com/bow_blue.svg")
];
  try {

  await poses.map((pose) => setPose(pose));
}
catch(e)
  {
    throw Exception(e.toString());
  }
}
*/
  static Future<String> loadImage(String img_url1)async {

    try{
      final String url= await FirebaseStorage.instance.ref().child(img_url1).getDownloadURL();


      return url;

    }
    catch(e){
      throw Exception(e.toString());
    }

  }


















}