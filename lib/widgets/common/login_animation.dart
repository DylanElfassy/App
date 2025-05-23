import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';

import '../../common/constants.dart';

class StaggerAnimation extends StatelessWidget {
  final VoidCallback? onTap;
  final String? titleButton;

  StaggerAnimation({
    super.key,
    required this.buttonController,
    this.onTap,
    this.titleButton,
  })  : buttonSqueezeanimation = Tween(
          begin: 320.0,
          end: 50.0,
        ).animate(
          CurvedAnimation(
            parent: buttonController,
            curve: const Interval(
              0.0,
              0.150,
            ),
          ),
        ),
        containerCircleAnimation = EdgeInsetsTween(
          begin: const EdgeInsets.only(bottom: 30.0),
          end: const EdgeInsets.only(bottom: 0.0),
        ).animate(
          CurvedAnimation(
            parent: buttonController,
            curve: const Interval(
              0.500,
              0.800,
              curve: Curves.ease,
            ),
          ),
        );

  final AnimationController buttonController;
  final Animation<EdgeInsets> containerCircleAnimation;
  final Animation buttonSqueezeanimation;

  Widget _buildAnimation(BuildContext context, Widget? child) {
    final backgroundButton = Theme.of(context).primaryColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonSqueezeanimation.value,
        height: 50,
        alignment: FractionalOffset.center,
        decoration: BoxDecoration(
          color: backgroundButton,
          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: buttonSqueezeanimation.value > 75.0
            ? Text(
                titleButton ?? S.of(context).signIn,
                style: TextStyle(
                  color: backgroundButton.getColorBasedOnBackground,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.3,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              )
            : const CircularProgressIndicator(
                value: null,
                strokeWidth: 1.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: buttonController,
    );
  }
}
