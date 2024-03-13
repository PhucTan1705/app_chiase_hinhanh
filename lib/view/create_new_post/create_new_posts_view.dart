import 'dart:io';

import 'package:chiase_hinhanh/state/auth/providers/user_id_provider.dart';
import 'package:chiase_hinhanh/state/image_upload/models/file_type.dart';
import 'package:chiase_hinhanh/state/image_upload/models/thumbnail_request.dart';
import 'package:chiase_hinhanh/state/image_upload/providers/image_uploader_provider.dart';
import 'package:chiase_hinhanh/state/post_setting/models/post_setting.dart';
import 'package:chiase_hinhanh/state/post_setting/providers/post_setting_provider.dart';
import 'package:chiase_hinhanh/view/compoments/file_thumbnail_view.dart';
import 'package:chiase_hinhanh/view/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateNewPostsView extends StatefulHookConsumerWidget {
  final File filePosts;
  final FileType fileType;
  const CreateNewPostsView({
    super.key,
    required this.filePosts,
    required this.fileType,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateNewPostsViewState();
}

class _CreateNewPostsViewState extends ConsumerState<CreateNewPostsView> {
  @override
  Widget build(BuildContext context) {
    final thumbnailRequest = ThumbnailRequest(
      file: widget.filePosts,
      fileType: widget.fileType,
    );
    final postSettings = ref.watch(postSettingProvider);
    final postsController = useTextEditingController();
    final isPostButtonEnabled = useState(false);
    useEffect(() {
      void listener() {
        isPostButtonEnabled.value = postsController.text.isNotEmpty;
      }

      postsController.addListener(listener);

      return () {
        postsController.removeListener(listener);
      };
    }, [postsController]);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.createNewPost,
        ),
        actions: [
          IconButton(
            onPressed: isPostButtonEnabled.value
                ? () async {
                    final userId = ref.read(
                      userIdProvider,
                    );
                    if (userId == null) {
                      return;
                    }
                    final message = postsController.text;
                    final isUploaded =
                        await ref.read(imageUploadProvider.notifier).upload(
                              file: widget.filePosts,
                              fileType: widget.fileType,
                              message: message,
                              postSettings: postSettings,
                              userId: userId,
                            );
                    if (isUploaded && mounted) {
                      Navigator.of(context).pop();
                    }
                  }
                : null,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //thumbnail
            FileThumbnailView(
              thumbnailRequest: thumbnailRequest,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                    labelText: Strings.pleaseWriteYourMessageHere),
                autofocus: true,
                maxLines: null,
                controller: postsController,
              ),
            ),
            ...PostSetting.values.map(
              (postSetting) => ListTile(
                title: Text(postSetting.title),
                subtitle: Text(postSetting.description),
                trailing: Switch(
                  value: postSettings[postSetting] ?? false,
                  onChanged: (isOn) {
                    ref.read(postSettingProvider.notifier).setSetting(
                          postSetting,
                          isOn,
                        );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
