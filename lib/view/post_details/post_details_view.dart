import 'package:chiase_hinhanh/enum/date_sorting.dart';
import 'package:chiase_hinhanh/state/comments/models/post_comment_request.dart';
import 'package:chiase_hinhanh/state/posts/models/post.dart';
import 'package:chiase_hinhanh/state/posts/providers/can_curent_user_delete_post_provider.dart';
import 'package:chiase_hinhanh/state/posts/providers/delete_post_provider.dart';
import 'package:chiase_hinhanh/state/posts/providers/specific_post_with_comment_provider.dart';
import 'package:chiase_hinhanh/view/components/animations/error_animation_view.dart';
import 'package:chiase_hinhanh/view/components/animations/loading_animation_view.dart';
import 'package:chiase_hinhanh/view/components/animations/small_error_animation_view.dart';
import 'package:chiase_hinhanh/view/components/comment/compact_comment_column.dart';
import 'package:chiase_hinhanh/view/components/dialogs/alter_dialog_model.dart';
import 'package:chiase_hinhanh/view/components/dialogs/delete_dialog.dart';
import 'package:chiase_hinhanh/view/components/like_button.dart';
import 'package:chiase_hinhanh/view/components/likes_count_view.dart';
import 'package:chiase_hinhanh/view/components/post/post_date_view.dart';
import 'package:chiase_hinhanh/view/components/post/post_display_name_and_message_view.dart';
import 'package:chiase_hinhanh/view/components/post/post_image_or_video_view.dart';
import 'package:chiase_hinhanh/view/constants/strings.dart';
import 'package:chiase_hinhanh/view/post_comments/post_comment_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class PostDetailsView extends ConsumerStatefulWidget {
  final Post post;
  const PostDetailsView({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PostDetailsViewState();
}

class _PostDetailsViewState extends ConsumerState<PostDetailsView> {
  @override
  Widget build(BuildContext context) {
    final request = RequestForPostAndComments(
      postId: widget.post.postId,
      limit: 3, // at most 3 comments
      sortByCreatedAt: true,
      dateSorting: DateSorting.oldestOntop,
    );

    // get the actual post together with its comments
    final postWithComments = ref.watch(
      specificPostWithCommentsProvider(
        request,
      ),
    );

    // can we delete this post?
    final canDeletePost = ref.watch(
      canCurrentUserDeletePostProvider(
        widget.post,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.postDetails,
        ),
        actions: [
          // share button is always present
          postWithComments.when(
            data: (postWithComments) {
              return IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  final url = postWithComments.post.fileUrl;
                  Share.share(
                    url,
                    subject: Strings.checkOutThisPost,
                  );
                },
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
          ),
          // delete button or no delete button if user cannot delete this post
          if (canDeletePost.value ?? false)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                final shouldDeletePost = await const DeleteDiaLog(
                        titleOfObjectToDelete: Strings.post)
                    .present(context)
                    .then((shouldDelete) => shouldDelete ?? false);
                if (shouldDeletePost) {
                  await ref
                      .read(deletePostProvider.notifier)
                      .deletePost(post: widget.post);
                  if (mounted) {
                    Navigator.of(context).pop();
                  }
                }
                // delete the post now
              },
            )
        ],
      ),
      body: postWithComments.when(
        data: (postWithComments) {
          final postId = postWithComments.post.postId;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PostImageOrVideoView(
                  post: postWithComments.post,
                ),
                // like and comment buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // nut like luan neu cho phep like
                    if (postWithComments.post.allowLikes)
                      LikeButton(
                        postId: postId,
                      ),
                    // nut binh luan neu cho phep binh luan
                    if (postWithComments.post.allowComments)
                      IconButton(
                        icon: const Icon(
                          Icons.mode_comment_outlined,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PostCommentsView(
                                postId: postId,
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
                // chit tiet post
                PostDisplayNameandMessageView(
                  post: postWithComments.post,
                ),
                PostDateView(
                  dateTime: postWithComments.post.createdAt,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    color: Colors.black54,
                  ),
                ),
                // comments
                CompactCommentColumn(
                  comments: postWithComments.comments,
                ),
                // display like count
                if (postWithComments.post.allowLikes)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        LikesCountView(
                          postId: postId,
                        ),
                      ],
                    ),
                  ),
                // add spacing to bottom of screen
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          );
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