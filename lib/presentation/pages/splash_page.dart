import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: themeColor.primary,
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(seconds: 2),
          tween: Tween<double>(begin: 1, end: 0.5),
          onEnd: () {
            context.go('/home');
          },
          builder: (context, double value, child) {
            return AnimatedScale(
              duration: const Duration(seconds: 1),
              scale: value,
              child: AnimatedOpacity(
                curve: Curves.bounceIn,
                opacity: value,
                duration: const Duration(seconds: 1),
                child: SvgPicture.asset(
                  'assets/icons/kevych_solutions_logo_icon.svg',
                  width: 80,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
