import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getId(Future<String?> number) async {
    var documentID;
    var collection = FirebaseFirestore.instance.collection('members');
    var querySnapshots =
        await collection.where("number", isEqualTo: number).get();
    for (var snapshot in querySnapshots.docs) {
      documentID = snapshot.id;
      print(documentID); // <-- Document ID
    }
    return documentID.toString();
  }

  addMembers(String number, memberdetails) async {
    FirebaseFirestore.instance
        .collection("members")
        .doc(number)
        .set(memberdetails)
        .catchError((e) {
      print(e.toString());
    });
  }

  getMemberById(String id) async {
    return await FirebaseFirestore.instance.collection("members").doc(id).get();
  }

  getMemberMobile(String number) async {
    return await FirebaseFirestore.instance
        .collection("customer")
        .where("number", isEqualTo: number)
        .get();
  }

  getAllMember() async {
    return await FirebaseFirestore.instance.collection("members").get();
  }
}