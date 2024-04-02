import 'package:chiase_hinhanh/state/posts/providers/all_post_provider.dart';
import 'package:chiase_hinhanh/view/components/animations/empty_contents_with_text_animation_view.dart';
import 'package:chiase_hinhanh/view/components/animations/loading_animation_view.dart';
import 'package:chiase_hinhanh/view/components/animations/small_error_animation_view.dart';
import 'package:chiase_hinhanh/view/components/post/posts_grid_view.dart';
import 'package:chiase_hinhanh/view/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(allPostProvider);
    return RefreshIndicator(
      onRefresh: () {
        ref.refresh(allPostProvider);
        return Future.delayed(
          const Duration(
            seconds: 1,
          ),
        );
      },
      child: posts.when(
        data: (posts) {
          if (posts.isEmpty) {
            return const EmptyContentsWithTextAnimationView(
              text: Strings.noPostsAvailable,
            );
          } else {
            return PostGridView(
              posts: posts,
            );
          }
        },
        error: (error, stackTrace) {
          return const SmallErrorAnimationView();
        },
        loading: () {
          return const LoadingAnimationView();
        },
      ),
    );
  }
}
