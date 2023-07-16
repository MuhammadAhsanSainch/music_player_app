import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_player_app/models/video.dart';

class VideoController extends GetxController {
  var videos = <Video>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchVideos();
  }

  void fetchVideos() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/trending/all/day?api_key=39cf98d7db1ad3069227393fa6315d10'));
    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body)['results'];
      List<Video> videoList = [];
      for (var json in jsonList) {
        videoList.add(Video.fromJson(json));
      }
      videos.value = videoList;
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
