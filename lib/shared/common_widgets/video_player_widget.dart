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

  @override
  void initState() {
    super.initState();
    print('link video: ${widget.resource}');
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        widget.resource))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.

        setState(() {
          // _controller.play();
        });
      });
  }
  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        children: [
          VideoPlayer(_controller),
          Center(child:
           IconButton(icon: Icon(_controller.value.isPlaying ? Icons.pause_circle : Icons.play_circle, size: 20,),onPressed: (){
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },),
          )
        ],
      ),
    )
        : Container();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
