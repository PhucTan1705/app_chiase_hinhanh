import 'dart:collection' show MapView;

import 'package:chiase_hinhanh/state/constants/firebase_field_name.dart';
import 'package:chiase_hinhanh/state/posts/typedefs/post_id.dart';
import 'package:chiase_hinhanh/state/posts/typedefs/user_id.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class Like extends MapView<String, String> {
  Like({
    required PostId postId,
    required UserId likedBy,
    required DateTime date,
  }) : super(
          {
            FirebaseFieldName.postId: postId,
            FirebaseFieldName.userId: likedBy,
            FirebaseFieldName.date: date.toIso8601String(),
          },
        );
}

