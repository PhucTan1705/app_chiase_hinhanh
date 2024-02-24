import 'package:chiase_hinhanh/view/compoments/animations/lottie_animation_view.dart';
import 'package:chiase_hinhanh/view/compoments/animations/models/lottie_animation.dart';

class EmptyContentAnimationView extends LottieAnimationView {
  const EmptyContentAnimationView({super.key})
      : super(
          animation: LottieAnimation.empty,
        );
}
