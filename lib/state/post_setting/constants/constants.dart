import 'package:flutter/foundation.dart' show immutable;

@immutable
class Constants {
  static const allowLikesTitle = 'Cho phép thích';
  static const allowLikesDescription =
      'Khi cho phép thích, người dùng khác có thể nhấn thích trên bài đăng của bạn.';
  static const allowLikesStorageKey = 'allow_likes';
  static const allowCommentsTitle = 'Cho phép bình luận';
  static const allowCommentsDescription =
      'Khi cho phép bình luận, người dùng khác có thể bình luận trên bài đăng của bạn.';
  static const allowCommentsStorageKey = 'allow_comments';

  const Constants._();
}