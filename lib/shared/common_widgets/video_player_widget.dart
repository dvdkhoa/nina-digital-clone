import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String resource;

  const VideoPlayerWidget({super.key, required this.resource});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    print('link video: ${widget.resource}');
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.resource))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.

        _chewieController = ChewieController(
          videoPlayerController: _controller,
          autoPlay: true,
          looping: false,
        );

        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              children: [
                Chewie(controller: _chewieController),
                // VideoPlayer(_controller),
                // Center(
                //   child: IconButton(
                //     icon: Icon(
                //       _controller.value.isPlaying
                //           ? Icons.pause_circle
                //           : Icons.play_circle,
                //       size: 20,
                //     ),
                //     onPressed: () {
                //       setState(() {
                //         _controller.value.isPlaying
                //             ? _controller.pause()
                //             : _controller.play();
                //       });
                //     },
                //   ),
                // )
              ],
            ),
          )
        : Container();
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _controller.dispose();
    super.dispose();
  }
}
