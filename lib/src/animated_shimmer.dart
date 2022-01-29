import 'package:flutter/material.dart';

/// A simple & lightweight widget to display a animated shimmer effect.
///
/// Making a skeleton of a widget with shimmer effect while loading data from server or any other source is a common task that can be easily done with [AnimatedShimmer] widget.
/// [AnimatedShimmer] is a simple yet very useful [Widget] that developers can use it to create an awesome animated shimmer effect for any widget skeleton loading.
///
/// It's easy, just give the widget height and width and it will create a shimmer effect for you, further you can customize the shimmer effect by giving [startCOlor], [endColor], [borderRadius] and [delayInMilliSeconds] properties.
///
/// - @required [height] : accepts a [double] to set height of the shimmer effect
/// - @required [width] : accepts a [double] to set width of the shimmer effect
/// - [startColor] : accepts a [Color] and sets the start color of the shimmer effect from which animation will start
/// - [endColor] : accepts a [Color] and sets the end color of the shimmer effect to which animation will end
/// - [borderRadius] : accepts a [BorderRadius] and sets the border radius of the animated shimmer widget
/// - [delayInMilliSeconds] : accepts a [Duration] that would be the delay in starting the animation. Default value is [Duration(milliseconds: 0)]
class AnimatedShimmer extends StatefulWidget {
  /// Accepts a [double] to set width of the shimmer effect
  final double width;

  /// Accepts a [double] to set height of the shimmer effect
  final double height;

  /// Accepts a [Color] and sets the start color of the shimmer effect from which animation will start
  final Color? startColor;

  /// Accepts a [Color] and sets the end color of the shimmer effect to which animation will end
  final Color? endColor;

  /// Accepts a [BorderRadius] and sets the border radius of the animated shimmer widget
  final BorderRadius borderRadius;

  /// Accepts a [Duration] that would be the delay in starting the animation. Default value is [Duration(milliseconds: 0)]
  final Duration delayInMilliSeconds;

  const AnimatedShimmer(
      {Key? key,
      this.borderRadius = const BorderRadius.all(
        Radius.circular(0),
      ),
      this.startColor = const Color(0xffE6E8EB),
      this.endColor = const Color(0x77E6E8EB),
      this.delayInMilliSeconds = const Duration(milliseconds: 0),
      required this.width,
      required this.height})
      : assert((endColor != null && startColor != null)),
        super(key: key);

  /// Use this to create a round loading widget
  factory AnimatedShimmer.round({
    required double size,
    Color? startColor = const Color(0xffE6E8EB),
    Color? endColor = const Color(0x77E6E8EB),
  }) =>
      AnimatedShimmer(
        height: size,
        width: size,
        borderRadius: BorderRadius.all(
          Radius.circular(size / 2),
        ),
        startColor: startColor,
        endColor: endColor,
      );

  @override
  _AnimatedShimmerState createState() => _AnimatedShimmerState();
}

class _AnimatedShimmerState extends State<AnimatedShimmer>
    with SingleTickerProviderStateMixin {
  // AnimationController for starting and driving the animation
  late AnimationController _animationController;
  // Animation which will hold the ColorTween values
  late Animation _colorAnimation;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    // Initializing AnimationController
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    // ColorTween Animation
    _colorAnimation = ColorTween(begin: widget.startColor, end: widget.endColor)
        .animate(_animationController);

    // Trigger the animation only after build is rendered
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      // Check if any delay is requested
      if (widget.delayInMilliSeconds.inMilliseconds == 0) {
        _animationController.forward();
      } else {
        Future.delayed(widget.delayInMilliSeconds, () {
          // start the animation
          _animationController.forward();
        });
      }
    });

    // Adding listener to the AnimationController so that
    // we can put it in a loop based on it's status
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Reverse the animation if it's completed
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // Restart the animation if it's dismissed
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: _colorAnimation.value,
            borderRadius: widget.borderRadius,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // Dispose the AnimationController when the widget is disposed
    _animationController.dispose();
    super.dispose();
  }
}
