import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/controllers/video_controller.dart';
import 'package:video_player_app/view/video_player_screen.dart';

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({super.key});

  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  final videoController = Get.put(VideoController());
  int _selectedIndex = 0;
  // static final List<Widget> _widgetOptions = <Widget>[
  // const Home(),
  // const Movie(),
  // const Music(),
  // ];
  void _onTapped(int a) {
    setState(() {
      _selectedIndex = a;
    });
  }

  List images = [
    'assets/images/birdbox.jpg',
    'assets/images/transformers.jpeg',
    'assets/images/mission.jpeg',
    'assets/images/guardians.jpeg',
    'assets/images/asteroid.jpeg',
    'assets/images/barbie.jpg',
    'assets/images/oppenheimer.jpeg',
    'assets/images/birdbox.jpg',
    'assets/images/transformers.jpeg',
    'assets/images/mission.jpeg',
    'assets/images/guardians.jpeg',
    'assets/images/asteroid.jpeg',
    'assets/images/barbie.jpg',
    'assets/images/oppenheimer.jpeg',
    'assets/images/transformers.jpeg',
    'assets/images/mission.jpeg',
    'assets/images/guardians.jpeg',
    'assets/images/asteroid.jpeg',
    'assets/images/barbie.jpg',
    'assets/images/oppenheimer.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: const Drawer(),
      appBar: AppBar(
        title: MyText(
          title: "Watch",
          fontSize: 0.06,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/wonder_woman.jpg',
            height: MediaQuery.sizeOf(context).height * 0.45,
            fit: BoxFit.cover,
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
          //Watch Movies
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.01),
            child: const MyText(
              title: 'Watch Movies',
              fontSize: 0.06,
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.3,
            padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.01),
            alignment: Alignment.centerLeft,
            child: Obx(
              () {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: videoController.videos.length,
                  itemBuilder: (context, index) {
                    final video = videoController.videos[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                VideoPlayerScreen(overView: video.overview),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            images[index],
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            height: MediaQuery.sizeOf(context).height * 0.22,
                            fit: BoxFit.cover,
                          ),

                          SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.01),
                          // Movie title
                          MyText(
                            title: video.originalTitle,
                            fontSize: 0.035,
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.sizeOf(context).height * 0.008),
                          // Movie subtitle
                          MyText(
                            title: video.releaseDate,
                            fontSize: 0.025,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_creation_outlined), label: 'Movie'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.games_outlined), label: 'Games'),
          BottomNavigationBarItem(
              icon: Icon(Icons.music_note_outlined), label: 'Music'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        onTap: _onTapped,
        backgroundColor: Colors.black,
      ),
    );
  }
}

class MyText extends StatelessWidget {
  final double fontSize;
  final title;
  const MyText({super.key, required this.title, this.fontSize = 0.06});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.start,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: MediaQuery.sizeOf(context).width * fontSize),
    );
  }
}
