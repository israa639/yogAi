import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/Round_specs.dart';
import '../models/Rounds_model.dart';

class roundsRepository{


  final _firestore=FirebaseFirestore.instance;
  final _fireStorage=FirebaseStorage.instance;
  late final List<Round>program_rounds;

  //method to get poses data from firestore
  Future<List<String>> get_program_Rounds_id()async
  {
    try{
    final documentSnapshot =
    await _firestore.collection('program_rounds').get();


    if (documentSnapshot.size>=0) {

      return  documentSnapshot.docs.map((doc)=>doc["round_id"].toString()).toList();

      // return poses;
    }}
    catch(e)
    {
      throw Exception(e.toString());
    }
return [];
  }

  Future<void> get_program_Rounds(List<String> program_rounds_id)async
  {
for(int i=0;i<program_rounds_id.length;i++)
  {
    try {
      var documentSnapshot =
      await _firestore.collection('rounds').doc(program_rounds_id[i]).get();

      program_rounds.add(Round(round_specs:Round_specs.fromSnapshot(documentSnapshot) ));
    }
    catch(e)
    {
      throw Exception(e.toString());
    }
  }

  }
  Future<Round_specs> getRound(String round_id)async
  {
    try {
      final documentSnapshot = await _firestore.collection('rounds').doc(
          round_id).get();
      return Round_specs.fromSnapshot(documentSnapshot);
    }
    catch(e)
    {
      throw Exception(e.toString());
    }


  }
  Future<void> addRound(Round_specs round_specs)async
  {
  try {

    await  _firestore.collection('rounds') .add(round_specs.toDocument());

  }
  catch(e)
  {
    throw Exception(e.toString());
  }
  }

  Future<void> delete_Round(String round_id)async
  {
    try {

      await  _firestore.collection('rounds') .doc(round_id).delete();

    }
    catch(e)
    {
      throw Exception(e.toString());
    }
  }





















}