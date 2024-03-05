import 'package:flutter/foundation.dart' show immutable;

@immutable
class Strings {

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