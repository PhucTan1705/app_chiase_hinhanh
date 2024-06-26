import 'package:chiase_hinhanh/state/comments/models/comment.dart';
import 'package:chiase_hinhanh/state/user_info/providers/user_info_model_provider.dart';
import 'package:chiase_hinhanh/view/components/animations/small_error_animation_view.dart';
import 'package:chiase_hinhanh/view/components/rich_two_parts_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CompactCommentTile extends ConsumerWidget {
  final Comment comment;
  const CompactCommentTile({
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
        return RichTwoPartsText(
          leftPart: userInfo.displayName,
          rightPart: comment.comment,
        );
      },
      error: (error, stackTrace) {
        return const SmallErrorAnimationView();
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
