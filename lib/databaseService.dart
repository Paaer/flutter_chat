import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat/model.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> chatStream() {
    return _db
        .collection('chats')
        .orderBy('date', descending: true)
        .snapshots();
  }

  Future<Message> getMessage(String id) async {
    // var snap = await _db.collection('chats').doc(id).get();
    return Message(); //Message.fromFirestore(snap);
  }

  add({Message? message}) async {
    await _db.collection('chats').add(message?.toMap());
  }
  //TODO: delete message
  //...
}
