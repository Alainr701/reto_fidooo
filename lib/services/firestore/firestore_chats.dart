// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
// import 'package:fidooo_bot_frontend/data/conversation_entity.dart';

// class FirestoreChats {
//   final firestore.CollectionReference conversationsCollection =
//       firestore.FirebaseFirestore.instance.collection("conversations");
// import 'package:cloud_firestore/cloud_firestore.dart' as firestore;

//   Stream<List<ConversationEntity?>> getConversations() {
//     log("** Getting conversations from FirestoreAPI");
//     return conversationsCollection.snapshots().map((snapshot) {
//       return snapshot.docs.map((doc) {
//         try {
//           Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
//           map['id'] = doc.id;
//           return ConversationEntity.fromJson(map);
//         } catch (e) {
//           log(e.toString());
//         }
//       }).toList();
//     });
//   }
// }
