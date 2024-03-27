import 'package:chiase_hinhanh/state/comments/models/comment.dart';
import 'package:chiase_hinhanh/view/components/comment/compact_comment_tile.dart';
import 'package:flutter/material.dart';

class CompactCommentColumn extends StatelessWidget {
  final Iterable<Comment> comments;
  const CompactCommentColumn({
    super.key,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    if (comments.isEmpty) {
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        bottom: 8.0,
        right: 8.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: comments.map((comment) {
          return CompactCommentTile(
            comment: comment,
          );
        }).toList(),
      ),
    );
  }
}
