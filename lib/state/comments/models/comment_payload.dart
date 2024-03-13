import 'dart:collection' show MapView;

import 'package:chiase_hinhanh/state/constants/firebase_field_name.dart';
import 'package:chiase_hinhanh/state/posts/typedefs/post_id.dart';
import 'package:chiase_hinhanh/state/posts/typedefs/user_id.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class CommentPayLoad extends MapView<String, dynamic> {
  CommentPayLoad({
    required UserId fromUserId,
    required PostId onPostId,
    required String comment,
  }) : super({
    FirebaseFieldName.userId: fromUserId,
    FirebaseFieldName.postId: onPostId,
    FirebaseFieldName.comment: comment,
    FirebaseFieldName.createdAt: FieldValue.serverTimestamp()
  });
}