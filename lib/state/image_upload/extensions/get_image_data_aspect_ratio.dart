import 'package:chiase_hinhanh/state/image_upload/extensions/get_image_aspect_ratio.dart';
import 'package:flutter/foundation.dart' show Uint8List;
import 'package:flutter/material.dart' as material show Image;

extension GetImageDataAspectRatio on Uint8List {
  Future<double> getAspectRatio() {
    final image = material.Image.memory(this);
    return image.getAspectRatio();
  }
}