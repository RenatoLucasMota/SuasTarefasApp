import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';

class ProgressBarWidget extends StatefulWidget {
  ProgressBarWidget({
    this.progress,
    this.color = Colors.red,
    this.backgroundColor = Colors.grey,
  });
  final Color backgroundColor;
  final Color color;
  final double progress;

  @override
  _ProgressBarWidgetState createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> {
  MultiTrackTween _multiTrackTween;
  @override
  void initState() {
    super.initState();
    _multiTrackTween = MultiTrackTween([
      Track("size").add(
          Duration(seconds: 1), Tween(begin: 0.0, end: widget.progress),
          curve: Curves.easeInOutCubic),
    ]);
  }

  Widget progressBar() => ControlledAnimation(
      playback: Playback.PLAY_FORWARD,
      duration: _multiTrackTween.duration,
      tween: _multiTrackTween,
      builder: (context, animation) {
        return FractionallySizedBox(
          widthFactor: animation['size'],
          heightFactor: 1.0,
          child: Container(
            decoration: ShapeDecoration(
              shape: StadiumBorder(),
              color: widget.color,
            ),
          ),
        );
      });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      alignment: Alignment.centerLeft,
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: Colors.grey[800],
      ),
      child: progressBar(),
    );
  }
}
