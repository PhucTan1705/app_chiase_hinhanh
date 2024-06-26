import 'package:chiase_hinhanh/state/posts/models/post.dart';
import 'package:chiase_hinhanh/view/components/post/post_thumbnail_view.dart';
import 'package:chiase_hinhanh/view/post_details/post_details_view.dart';
import 'package:flutter/material.dart';

class PostGridView extends StatelessWidget {
  final Iterable<Post> posts;
  const PostGridView({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts.elementAt(index);
        return PostThumbnailView(
          post: post,
          onTapped: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostDetailsView(
                  post: post,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
