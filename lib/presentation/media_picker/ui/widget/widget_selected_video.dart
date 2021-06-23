import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:zporter_preview/gen/assets.gen.dart';
import 'package:zporter_preview/presentation/media_picker/ui/widget/widget_media_item.dart';

class LastSelectedVideo extends StatefulWidget {
  const LastSelectedVideo({
    Key? key,
    required this.videoFile,
  }) : super(key: key);

  final Future<File?> videoFile;

  @override
  _LastSelectedVideoState createState() => _LastSelectedVideoState();
}

class _LastSelectedVideoState extends State<LastSelectedVideo> {
  late VideoPlayerController _controller;
  bool initialized = false;

  @override
  void initState() {
    _initVideo();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _initVideo() async {
    initialized =false;
    final video = await widget.videoFile;
    _controller = VideoPlayerController.file(video!)
      ..setLooping(true)
      ..initialize().then((_) => setState(() => initialized = true))
      ..play();
  }
  @override
  void didUpdateWidget(covariant LastSelectedVideo oldWidget) {
    _controller.dispose();
    _initVideo();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return initialized
        ? GestureDetector(
            onTap: () {
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              });
            },
            child: Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  children: [
                    VideoPlayer(_controller),
                    Visibility(
                      visible: !_controller.value.isPlaying,
                      child: Center(
                        child: Assets.images.playCircleIcon.svg(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Center(
            child: loadWidget,
          );
  }
}
