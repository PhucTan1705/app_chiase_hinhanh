import 'package:chiase_hinhanh/state/posts/providers/user_posts_provider.dart';
import 'package:chiase_hinhanh/view/compoments/animations/empty_contents_with_text_animation_view.dart';
import 'package:chiase_hinhanh/view/compoments/animations/error_animation_view.dart';
import 'package:chiase_hinhanh/view/compoments/animations/loading_animation_view.dart';
import 'package:chiase_hinhanh/view/compoments/post/posts_grid_view.dart';
import 'package:chiase_hinhanh/view/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserPostsView extends ConsumerWidget {
  const UserPostsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(userPostsProvider);
    return RefreshIndicator(
      onRefresh: () {
        ref.refresh(userPostsProvider);
        return Future.delayed(
          const Duration(seconds: 1),
        );
      },
      child: posts.when(
        data: (posts) {
          if (posts.isEmpty) {
            return const EmptyContentsWithTextAnimationView(
              text: Strings.youHaveNoPosts,
            );
          } else {
            return PostGridView(
              posts: posts,
            );
          }
        },
        error: (error, stackTrace) {
          return const ErrorAnimationView();
        },
        loading: () {
          return const LoadingAnimationView();
        },
      ),
    );
  }
}
