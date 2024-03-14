import 'package:chiase_hinhanh/state/auth/providers/auth_state_provider.dart';
import 'package:chiase_hinhanh/state/image_upload/helpers/imgae_picker_helper.dart';
import 'package:chiase_hinhanh/state/image_upload/models/file_type.dart';
import 'package:chiase_hinhanh/state/post_setting/providers/post_setting_provider.dart';
import 'package:chiase_hinhanh/view/components/dialogs/alter_dialog_model.dart';
import 'package:chiase_hinhanh/view/components/dialogs/log_out_dialog.dart';
import 'package:chiase_hinhanh/view/constants/strings.dart';
import 'package:chiase_hinhanh/view/create_new_post/create_new_posts_view.dart';
import 'package:chiase_hinhanh/view/tabs/user_posts/user_posts_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            Strings.appName,
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.add_photo_alternate_outlined,
              ),
              onPressed: () async {
                // chon anh
                final imageFile =
                    await ImagePickerHelper.pickImageFromGallery();
                if (imageFile == null) {
                  return;
                }

                ref.refresh(postSettingProvider);

                //
                if (!mounted) {
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateNewPostsView(
                      filePosts: imageFile,
                      fileType: FileType.image,
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.film,
              ),
              onPressed: () async {
                // chon video
                final videoFile =
                    await ImagePickerHelper.pickVideoFromGallery();
                if (videoFile == null) {
                  return;
                }

                ref.refresh(postSettingProvider);

                //
                if (!mounted) {
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateNewPostsView(
                      filePosts: videoFile,
                      fileType: FileType.video,
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.logout,
              ),
              onPressed: () async {
                final shouldLogOut = await const LogOutDilog()
                    .present(context)
                    .then((value) => value ?? false);
                if (shouldLogOut) {
                  await ref.read(authStateProvider.notifier).logOut();
                }
              },
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.person,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.search,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.home,
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UserPostsView(),
            UserPostsView(),
            UserPostsView(),
          ],
        ),
      ),
    );
  }
}
