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
  Future<void> setPose(Pose pose)async
  {
  try {

    await  _firestore.collection('poses') .doc(pose.pose_img_url).set(pose.toDocument());

  }
  catch(e)
    {
    throw Exception('failed upload poses');
    }
  }
Future<void> addPoses()async
{ List<Pose>poses = [
  new Pose(pose_name: "chair",
      pose_img_url: "chair_blue.svg",pose_time: 10),
  new Pose(pose_name: "cobra",
      pose_img_url: "cobra_blue.svg",pose_time: 10),
  new Pose(pose_name: "downward facing dog",
      pose_img_url: "downward_facing_dog_blue.svg",pose_time: 10),
  new Pose(pose_name: "plank",
      pose_img_url: "plank_pose_blue.svg",pose_time: 10),
  new Pose(pose_name: "tree",
      pose_img_url: "tree_pose.svg",pose_time: 10),
  new Pose(pose_name: "triangle",
      pose_img_url: "triangle_pose_blue.svg",pose_time: 10),
  new Pose(pose_name: "chair",
      pose_img_url: "chair_blue.svg",pose_time: 10),
  new Pose(pose_name: "upward plank",
      pose_img_url: "upward_plank_blue.svg",pose_time: 10),
  new Pose(pose_name: "warrior 1",
      pose_img_url: "warrior1_blue.svg",pose_time: 10),
  new Pose(pose_name: "warrior 2",
      pose_img_url: "warrior2_blue.svg",pose_time: 10),
  new Pose(pose_name: "bridge",
      pose_img_url: "bridge_blue.svg",pose_time: 10),

];
  try {
for(int i=0;i<poses.length;i++)
  {
    await setPose(poses[i]);
  }

}
catch(e)
  {
    throw Exception(e.toString());
  }
}

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