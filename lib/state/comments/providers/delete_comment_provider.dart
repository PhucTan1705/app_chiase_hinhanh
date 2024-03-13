import 'package:chiase_hinhanh/state/comments/notifiers/delete_comment_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../image_upload/typedefs/is_loading.dart';

final deleteCommnetProvider =
    StateNotifierProvider<DeleteCommentStateNotifier, IsLoading>(
  (_) => DeleteCommentStateNotifier(),
);
