import 'package:chiase_hinhanh/view/compoments/animations/lottie_animation_view.dart';
import 'package:chiase_hinhanh/view/compoments/animations/models/lottie_animation.dart';

class LoadingAnimationView extends LottieAnimationView {
  const LoadingAnimationView({super.key})
      : super(
          animation: LottieAnimation.loading,
        );
}