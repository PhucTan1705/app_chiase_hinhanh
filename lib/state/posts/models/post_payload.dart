import 'dart:collection' show MapView;

import 'package:chiase_hinhanh/state/image_upload/models/file_type.dart';
import 'package:chiase_hinhanh/state/post_setting/models/post_setting.dart';
import 'package:chiase_hinhanh/state/posts/models/post_key.dart';
import 'package:chiase_hinhanh/state/posts/typedefs/user_id.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class PostPayLoad extends MapView<String, dynamic> {
  PostPayLoad(
      {required UserId userId,
      required String message,
      required String thumbnailUrl,
      required String fileUrl,
      required FileType fileType,
      required String fileName,
      required double aspectRatio,
      required String thumbnailStorageId,
      required String originalFileStorageId,
      required Map<PostSetting, bool> postSettings})
      : super({
          PostKey.userId: userId,
          PostKey.message: message,
          PostKey.createdAt: FieldValue.serverTimestamp(),
          PostKey.thumbnailUrl: thumbnailUrl,
          PostKey.fileUrl: fileUrl,
          PostKey.fileType: fileType.name,
          PostKey.fileName: fileName,
          PostKey.aspectRatio: aspectRatio,
          PostKey.thumbnailStorageId: thumbnailStorageId,
          PostKey.originalFileStorageId: originalFileStorageId,
          PostKey.postSettings: {
            for (final postSetting in postSettings.entries)
              postSetting.key.storageKey: postSetting.value,
          },
        });
}
