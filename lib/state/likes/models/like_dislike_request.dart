import 'package:chiase_hinhanh/state/posts/typedefs/post_id.dart';
import 'package:chiase_hinhanh/state/posts/typedefs/user_id.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class LikeDislikeRequest {
  final PostId postId;
  final UserId likedBy;

  const LikeDislikeRequest({
    required this.postId,
    required this.likedBy,
  });
}
