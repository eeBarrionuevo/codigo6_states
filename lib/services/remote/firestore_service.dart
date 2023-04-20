import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  Future<List<Map>> getNotes() async {
    CollectionReference notesReferences =
        FirebaseFirestore.instance.collection("notes");
    QuerySnapshot collection = await notesReferences.get();
    List<QueryDocumentSnapshot> docs = collection.docs;
    List<Map> notes = [];
    for (var item in docs) {
      Map note = item.data() as Map;
      notes.add(note);
    }
    return notes;
  }
}
