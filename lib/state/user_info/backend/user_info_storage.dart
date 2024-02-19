import 'package:chiase_hinhanh/state/constants/firebase_collection_name.dart';
import 'package:chiase_hinhanh/state/constants/firebase_field_name.dart';
import 'package:chiase_hinhanh/state/posts/typedefs/user_id.dart';
import 'package:chiase_hinhanh/state/user_info/user_info_payload.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class UserInfoStorage {
  const UserInfoStorage();
  Future<bool> saveUserInfo({
    required UserId userId,
    required String displayName,
    required String? email,
  }) async {
    try {
      final userInfo = await FirebaseFirestore.instance
        .collection(
          FirebaseCollectionName.users,
        )
        .where(
          FirebaseFieldName.userId,
          isEqualTo: userId,
        )
        .limit(1)
        .get();

    if (userInfo.docs.isNotEmpty) {
      await userInfo.docs.first.reference.update({
        FirebaseFieldName.displayName: displayName,
        FirebaseFieldName.email: email ?? '',
      });
      return true;
    }

    //nguoi dung moi

    final payload = UserInfoPayLoad(
      userId: userId,
      displayName: displayName,
      email: email,
    );
    await FirebaseFirestore.instance
        .collection(
          FirebaseCollectionName.users,
        )
        .add(
          payload,
        );
      return true;
    }
    catch (e){
      return false;
    }
  }
}