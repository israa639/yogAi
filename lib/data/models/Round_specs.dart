import 'package:cloud_firestore/cloud_firestore.dart';

class Round_specs{

  final String round_name;
  final List<String> round_poses_id;
  final bool is_customized_round;
  final round_time;
  String?  round_img_url;

  Round_specs(
      {required this.round_name, required this.round_poses_id, required this.round_time, required this.is_customized_round,this.round_img_url});


  Map<String, dynamic> toDocument() {
    return {
      "round_name":round_name,
      "is_customized_round": is_customized_round,
      "poses_id": round_poses_id,
      "round_time": round_time,
      "poses_id":[],
    };
  }

  factory Round_specs.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snap) {

    return Round_specs(
      round_name: snap["round_name"],
      round_poses_id: snap["poses_id"] != null ? List<String>.from(snap["poses_id"]) :[],
      round_time: snap["round_time"],
      is_customized_round: snap["is_customized_round"],
        round_img_url:snap["round_img_url"]
    );
  }







}