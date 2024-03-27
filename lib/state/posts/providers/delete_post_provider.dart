import 'package:chiase_hinhanh/state/image_upload/typedefs/is_loading.dart';
import 'package:chiase_hinhanh/state/posts/notifiers/delete_post_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final deletePostProvider =
    StateNotifierProvider<DeletePostStateNotifier, IsLoading>(
  (_) => DeletePostStateNotifier(),
);
