// import 'dart:developer';

// import 'package:fidooo_bot_frontend/data/message_entity.dart';
// import 'package:firebase_database/firebase_database.dart';

// class RealTimeChat {
//   Stream<List<MessageEntity?>> getChatMessagesStream(String chatId) {
//     final DatabaseReference chatReference =
//         FirebaseDatabase.instance.ref('conversations/$chatId');

//     return chatReference.onValue.map((event) {
//       return event.snapshot.children.map((snapshot) {
//         try {
//           Map<String, dynamic> map = snapshot.value as Map<String, dynamic>;
//           map['id'] = snapshot.key;
//           return MessageEntity.fromJson(map);
//         } catch (e) {
//           log(e.toString());
//         }
//       }).toList();
//     });
//   }
// }
