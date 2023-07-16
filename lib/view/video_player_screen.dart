import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/view/video_list_screen.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String overView;
  const VideoPlayerScreen({Key? key, required this.overView}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController videoPlayerController;
  List images = [
    'assets/images/brie_larson.jpg',
    'assets/images/corey.jpg',
    'assets/images/jing.jpg',
    'assets/images/john.jpg',
    'assets/images/reilly.jpg',
    'assets/images/toby.jpg',
    'assets/images/tom.jpg',
    'assets/images/corey.jpg',
  ];
  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.asset('assets/videos/song.mp4');
    initializeVideoPlayer();
  }

  Future<void> initializeVideoPlayer() async {
    await videoPlayerController.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          videoPlayerController.value.isPlaying
              ? Center(
                  child: videoPlayerController.value.isInitialized
                      ? SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.45,
                          child: AspectRatio(
                            aspectRatio:
                                videoPlayerController.value.aspectRatio,
                            child: VideoPlayer(videoPlayerController),
                          ),
                        )
                      : const CircularProgressIndicator(),
                )
              : Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/kong.jpg',
                        height: MediaQuery.sizeOf(context).height * 0.45,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01),
                      const MyText(
                        title: "Directed by Jordan Vogt-Roberts",
                        fontSize: 0.04,
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01),
                      const MyText(
                        title: "The Cast",
                        fontSize: 0.05,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (String image in images)
                              Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.sizeOf(context).width * 0.01),
                                child: CircleAvatar(
                                    backgroundImage: AssetImage(image),
                                    radius: MediaQuery.sizeOf(context).width *
                                        0.07),
                              ),
                          ],
                        ),
                      ),
                      const MyText(
                        title: "Storyline",
                        fontSize: 0.05,
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01),
                      MyText(
                        title: widget.overView,
                        fontSize: 0.04,
                      )
                    ],
                  ),
                ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            if (videoPlayerController.value.isPlaying) {
              videoPlayerController.pause();
            } else {
              videoPlayerController.play();
            }
          });
        },
        child: Container(
          width: MediaQuery.sizeOf(context).width * .6,
          height: MediaQuery.sizeOf(context).height * .06,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(MediaQuery.sizeOf(context).width * .03),
            color: Colors.blue.withOpacity(.9),
            shape: BoxShape.rectangle,
          ),
          child: Center(
            child: MyText(
                fontSize: .04,
                title: videoPlayerController.value.isPlaying
                    ? 'Pause playing' //Icons.pause
                    : 'Resume playing' //Icons.play_arrow,
                ),
          ),
        ),
      ),
    );
  }
}
