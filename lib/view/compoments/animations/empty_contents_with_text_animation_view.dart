import 'package:chiase_hinhanh/view/compoments/animations/empty_contents_animation_view.dart';
import 'package:flutter/material.dart';

class EmptyContentsWithTextAnimationView extends StatelessWidget {
  final String text;
  const EmptyContentsWithTextAnimationView({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.black54),
            ),
          ),
          const EmptyContentAnimationView(),
        ],
      ),
    );
  }
}
