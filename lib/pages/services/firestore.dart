import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{

  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  Future<void> addNote(String note) async
  {
    try{
      await notes.add({
        'note': note,
        'timestamp': Timestamp.now(),
      });
  }
  catch(e){
    print('Error adding note: $e');
  }
  }


  Stream<QuerySnapshot> getNotesStream()
  {
    final noteStream = notes.orderBy('timestamp', descending: true).snapshots();
    return noteStream;
  }


}