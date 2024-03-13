import 'package:chiase_hinhanh/state/auth/providers/auth_state_provider.dart';
import 'package:chiase_hinhanh/state/image_upload/providers/image_uploader_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final isLoadingProvider = Provider<bool>(
  (ref) {
    final authState = ref.watch(authStateProvider);
    final isUploadingImage = ref.watch(imageUploadProvider);
    return authState.isLoading || isUploadingImage;
  },
);
