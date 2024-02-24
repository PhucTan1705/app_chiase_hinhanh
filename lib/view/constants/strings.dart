import 'package:flutter/foundation.dart';

@immutable
class Strings {
  static const appName = 'Chia Sẻ 123';
  static const welcomeToAppName = 'Chào mứng đến ${Strings.appName}';
  static const youHaveNoPosts =
      'Bạn chưa có bài đăng nào. Nhấn đăng video hoặc đăng ảnh để tạo bài đăng đầu tiên của bạn!';
  static const noPostsAvailable =
      "Dường như chưa có ai tạo bài đăng. Hãy trở thành người đầu tiên tạo bài đăng!";
  static const enterYourSearchTerm =
      'Nhập từ khóa bạn cần tìm kiếm. Từ khóa sẽ được tìm kiếm trong nội dung các bài đăng';
  static const facebook = 'Facebook';
  static const facebookSignupUrl = 'https://www.facebook.com/signup';
  static const google = 'Google';
  static const googleSignupUrl = 'https://accounts.google.com/signup';
  static const logIntoYourAccount =
      'Đăng nhập vào tài khoản của bạn bằng một trong hai cách sau';
  static const comments = 'Bình luận';
  static const writeYourCommentHere = 'Nhập bình luận của bạn...';
  static const checkOutThisPost = 'Xem bài đăng này!';
  static const postDetails = 'Chi tiết bài đăng';
  static const post = 'bài đăng';

  static const createNewPost = 'Tạo bài đăng mới';
  static const pleaseWriteYourMessageHere = 'Hãy nhập tin nhắn ở đây';

  static const noCommentsYet =
      'Chưa có bình luận nào. Bình luận ngay!';

  static const enterYourSearchTermHere = 'Nhập từ khóa tìm kiếm ở đây';

  // login view rich text at bottom
  static const dontHaveAnAccount = "Bạn có tài khoản chưa?\n";
  static const signUpOn = 'Đặng kí tại ';
  static const orCreateAnAccountOn = ' hoặc tạo tài khoản ở ';
  const Strings._();
}