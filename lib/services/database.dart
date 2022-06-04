import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/magazine.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({ this.uid });

  // collection references
  final CollectionReference magazineCollection = FirebaseFirestore.instance.collection('magazines');

  // magazine list from snapshot
  List<Magazine> _magazineListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      return Magazine(
          id: int.parse(doc.id.toString()),
          name: data['name'] ?? '',
          city: data['city'] ?? '',
          description: data['description'] ?? '',
          occupiedSpace: data['occupiedSpace'] ?? 0,
          maxSpace: data['maxSpace'] ?? 0
      );
    }).toList();
  }

  // get magazine stream
  Stream<List<Magazine>> get magazines {
    return magazineCollection.snapshots().map(_magazineListFromSnapshot);
  }

  // update magazine data
  Future updateMagazineData(
      int id,
      String name,
      String city,
      String description,
      num occupiedSpace,
      num maxSpace
  ) async {
    return await magazineCollection.doc(id.toString()).set({
      'name': name,
      'city': city,
      'description': description,
      'occupiedSpace': occupiedSpace,
      'maxSpace': maxSpace
    });
  }
}