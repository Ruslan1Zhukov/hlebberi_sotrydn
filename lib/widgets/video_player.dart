import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidget({required this.videoPath, super.key});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  double _opacity = 1.0;
  bool _isSwitching = false;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
    _controller.setLooping(true);
  }

  @override
  void didUpdateWidget(VideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoPath != widget.videoPath) {
      _fadeOutAndSwitchVideo();
    }
  }

  void _fadeOutAndSwitchVideo() async {
    setState(() {
      _opacity = 0.0;
      _isSwitching = true;
    });

    await Future.delayed(const Duration(milliseconds: 300));

    _controller.dispose();

    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {
          _isSwitching = false;
          _opacity = 1.0;
        });
        _controller.play();
      });
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: 250,
          height: 500,
          child: Stack(
            children: [
              _controller.value.isInitialized
                  ? AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(milliseconds: 300),
                child: VideoPlayer(_controller),
              )
                  : Container(),
              Center(
                child: _controller.value.isInitialized || _isSwitching
                    ? Container()
                    : const CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
