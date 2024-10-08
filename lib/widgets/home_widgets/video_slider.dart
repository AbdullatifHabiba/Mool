import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoSliderItem extends StatefulWidget {
  final String videoPath;

  const VideoSliderItem({super.key, required this.videoPath});

  @override
  _VideoSliderItemState createState() => _VideoSliderItemState();
}

class _VideoSliderItemState extends State<VideoSliderItem> {
  late VideoPlayerController _videoController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        _videoController.play();
        _isPlaying = true;
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _videoController.value.isInitialized
        ? GestureDetector(
            onTap: () {
              setState(() {
                if (_isPlaying) {
                  _videoController.pause();
                } else {
                  _videoController.play();
                }
                _isPlaying = !_isPlaying;
              });
            },
            child: AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: VideoPlayer(_videoController),
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
