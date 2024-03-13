import 'package:chiase_hinhanh/enum/date_sorting.dart';
import 'package:chiase_hinhanh/state/comments/models/comment.dart';
import 'package:chiase_hinhanh/state/comments/models/post_comment_request.dart';

extension Sorting on Iterable<Comment> {
  Iterable<Comment> applySortingFrom(RequestForPostAndComments request) {
    if (request.sortByCreatedAt) {
      final sortedDocuments = toList()
        ..sort(
          (a, b) {
            switch (request.dateSorting) {
              case DateSorting.newestOnTop:
                return b.createdAt.compareTo(a.createdAt);
              case DateSorting.oldestOntop:
                return a.createdAt.compareTo(b.createdAt);
            }
          },
        );

      return sortedDocuments;
    } else {
      return this;
    }
  }
}
