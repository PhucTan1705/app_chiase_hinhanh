import 'package:chiase_hinhanh/view/components/animations/lottie_animation_view.dart';
import 'package:chiase_hinhanh/view/components/animations/models/lottie_animation.dart';

class EmptyContentAnimationView extends LottieAnimationView {
  const EmptyContentAnimationView({super.key})
      : super(
          animation: LottieAnimation.empty,
        );
}
