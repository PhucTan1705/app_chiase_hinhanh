import 'package:chiase_hinhanh/state/post_setting/constants/constants.dart';

enum PostSetting {

  allowLikes(
    title: Constants.allowLikesTitle,
    description: Constants.allowLikesDescription,
    storageKey: Constants.allowLikesStorageKey,
  ),

  allowComments(
    title: Constants.allowCommentsTitle,
    description: Constants.allowCommentsDescription,
    storageKey: Constants.allowCommentsStorageKey,
  );

  final String title;
  final String description;
  final String storageKey;
  const PostSetting({
    required this.title,
    required this.description,
    required this.storageKey,
  });
}