import 'package:chiase_hinhanh/state/image_upload/notifiers/image_upload_notifier.dart';
import 'package:chiase_hinhanh/state/image_upload/typedefs/is_loading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final imageUploadProvider =
    StateNotifierProvider<ImageUploadNotifier, IsLoading>(
  (ref) => ImageUploadNotifier(),
);
