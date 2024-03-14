import 'package:chiase_hinhanh/state/posts/models/post.dart';
import 'package:chiase_hinhanh/state/user_info/providers/user_info_model_provider.dart';
import 'package:chiase_hinhanh/view/components/animations/small_error_animation_view.dart';
import 'package:chiase_hinhanh/view/components/rich_two_parts_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostDisplayNameandMessageView extends ConsumerWidget {
  final Post post;

  const PostDisplayNameandMessageView({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfoModel = ref.watch(
      userInfoModelProvider(
        post.userId,
      ),
    );
    return userInfoModel.when(
      data: (userInfoModel) {
        return RichTwoPartsText(
          leftPart: userInfoModel.displayName,
          rightPart: post.message,
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
