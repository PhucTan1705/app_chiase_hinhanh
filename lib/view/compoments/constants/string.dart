import 'package:flutter/foundation.dart';

@immutable
class Strings {
  static const allowLikesTitle = 'Cho phép thích';
  static const allowLikesDescription =
      'Khi cho phép thích, người dùng khác có thể nhấn thích trên bài đăng của bạn.';
  static const allowLikesStorageKey = 'allow_likes';
  static const allowCommentsTitle = 'Cho phép bình luận';
  static const allowCommentsDescription =
      'Khi cho phép bình luận, người dùng khác có thể bình luận trên bài đăng của bạn.';
  static const allowCommentsStorageKey = 'allow_comments';

  static const comment = 'Bình Luận';

  static const loading = 'Đang Tải...';

  static const person = 'người';
  //static const people = 'người';
  static const likedThis = 'thích điều này';

  static const delete = 'Xóa';
  static const areYouSureYouWantToDeleteThis =
      'Bạn có chắc muốn xóa';

  // log out
  static const logOut = 'Đăng Xuất';
  static const areYouSureThatYouWantToLogOutOfTheApp =
      'Bạn có muốn đăng xuất khỏi ứng dụng không?';
  static const cancel = 'Hủy';

  const Strings._();
}