import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Listen extends StatefulWidget {
  const Listen({Key? key}) : super(key: key);

  @override
  _ListenState createState() => _ListenState();
}

class _ListenState extends State<Listen> {

  String url = 'https://www.youtube.com/watch?v=lgm3puP3tMA';
  //https://www.youtube.com/watch?v=lgm3puP3tMA

  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.white)),
      ),
      body: Stack(
        children: [
          Container(
            transform: Matrix4.translationValues(0.0, -56.0, 0.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bgdesign.png"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _controller!.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(_controller!),
                      )
                    : Container(),
             VideoProgressIndicator(_controller!, allowScrubbing: true, padding: EdgeInsets.zero),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller!.value.isPlaying
                ? _controller!.pause()
                : _controller!.play();
          });
        },
        tooltip: _controller!.value.isPlaying ? 'Pause' : 'Play',
        child: Icon(
          _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow, size: 30
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller!.dispose();
  // }
}
