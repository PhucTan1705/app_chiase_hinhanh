import 'package:chiase_hinhanh/state/auth/providers/auth_state_provider.dart';
import 'package:chiase_hinhanh/state/comments/providers/delete_comment_provider.dart';
import 'package:chiase_hinhanh/state/comments/providers/send_comment_provider.dart';
import 'package:chiase_hinhanh/state/image_upload/providers/image_uploader_provider.dart';
import 'package:chiase_hinhanh/state/posts/providers/delete_post_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final isLoadingProvider = Provider<bool>(
  (ref) {
    final authState = ref.watch(authStateProvider);
    final isUploadingImage = ref.watch(imageUploadProvider);
    final isSendingComment = ref.watch(sendCommentProvider);
    final isDeletingComment = ref.watch(deleteCommnetProvider);
    final isDeletingPost = ref.watch(deletePostProvider);
    return authState.isLoading ||
        isUploadingImage ||
        isSendingComment ||
        isDeletingComment ||
        isDeletingPost;
  },
);
