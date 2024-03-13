import 'package:chiase_hinhanh/state/auth/providers/user_id_provider.dart';
import 'package:chiase_hinhanh/state/comments/models/comment.dart';
import 'package:chiase_hinhanh/state/comments/providers/delete_comment_provider.dart';
import 'package:chiase_hinhanh/state/user_info/providers/user_info_model_provider.dart';
import 'package:chiase_hinhanh/view/compoments/animations/small_error_animation_view.dart';
import 'package:chiase_hinhanh/view/compoments/constants/string.dart';
import 'package:chiase_hinhanh/view/compoments/dialogs/alter_dialog_model.dart';
import 'package:chiase_hinhanh/view/compoments/dialogs/delete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommentTile extends ConsumerWidget {
  final Comment comment;

  const CommentTile({
    super.key,
    required this.comment,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(
      userInfoModelProvider(
        comment.fromUserId,
      ),
    );
    return userInfo.when(
      data: (userInfo) {
        final currentUserId = ref.watch(userIdProvider);
        return ListTile(
          trailing: currentUserId == comment.fromUserId
              ? IconButton(
                  onPressed: () async {
                    final shouldDeleteComment = await displayDeleteDialog(
                      context,
                    );
                    if (shouldDeleteComment) {
                      await ref
                          .read(deleteCommnetProvider.notifier)
                          .deleteComment(commentId: comment.id);
                    }
                  },
                  icon: const Icon(
                    Icons.delete,
                  ),
                )
              : null,
          title: Text(
            userInfo.displayName,
          ),
          subtitle: Text(
            comment.comment,
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (error, stackTrace) {
        return const SmallErrorAnimationView();
      },
    );
  }

  Future<bool> displayDeleteDialog(BuildContext context) =>
      const DeleteDiaLog(titleOfObjectToDelete: Strings.comment)
          .present(context)
          .then(
            (value) => value ?? false,
          );
}
