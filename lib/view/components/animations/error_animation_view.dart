import 'package:chiase_hinhanh/view/components/animations/lottie_animation_view.dart';
import 'package:chiase_hinhanh/view/components/animations/models/lottie_animation.dart';

class ErrorAnimationView extends LottieAnimationView {
  const ErrorAnimationView({super.key})
      : super(
          animation: LottieAnimation.error,
        );
}