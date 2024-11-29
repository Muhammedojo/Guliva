import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  final List<Map<String, dynamic>> videos = [
    {
      'url':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
      'name': 'For Bigger Fun',
      'duration': '12:03',
    },
    {
      'url':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4',
      'name': 'Tears of Steel',
      'duration': '12:03',
    },
    {
      'url':
          'https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
      'name': 'Joy Ride',
      'duration': '12:03',
    },
    {
      'url':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
      'name': 'Sintel',
      'duration': '14:51',
    },
    {
      'url':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      'name': 'Big Buck Bunny',
      'duration': '9:56',
    },
  ];

  int _currentIndex = 0;
  bool _isLoading = false;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    if (videos.isNotEmpty && videos[_currentIndex]['url'] != null) {
      setState(() {
        _isLoading = true;
      });

      _videoPlayerController =
          VideoPlayerController.network(videos[_currentIndex]['url']);

      await _videoPlayerController!.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        aspectRatio: _videoPlayerController!.value.aspectRatio,
        autoPlay: true,
        looping: false,
      );

      setState(() {
        _isLoading = false;
      });
    }
  }

  void _onVideoSelected(int index) async {
    if (_currentIndex != index && !_isLoading) {
      setState(() {
        _currentIndex = index;
      });

      // Dispose old controllers before initializing new ones
      _videoPlayerController?.dispose();
      _chewieController?.dispose();

      await _initializePlayer();
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.8),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title:
            const Text('Video Player', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black.withOpacity(0.1),
      ),
      body: Column(
        children: [
          if (_chewieController != null &&
              _videoPlayerController!.value.isInitialized)
            AspectRatio(
              aspectRatio: _videoPlayerController!.value.aspectRatio,
              child: Chewie(controller: _chewieController!),
            )
          else
            Container(
              height: 200,
              color: Colors.black,
              child: Center(
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('No video selected',
                        style: TextStyle(color: Colors.white)),
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(
                    '${index + 1}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(videos[index]['name']),
                      Text(videos[index]['duration']),
                    ],
                  ),
                  onTap: () {
                    if (index == _currentIndex) {
                      if (_videoPlayerController != null) {
                        if (_videoPlayerController!.value.isPlaying) {
                          _videoPlayerController!.pause();
                          setState(() {
                            _isPlaying = false;
                          });
                        } else {
                          _videoPlayerController!.play();
                          setState(() {
                            _isPlaying = true;
                          });
                        }
                      }
                    } else {
                      _onVideoSelected(index);
                    }
                  },
                  selected: index == _currentIndex,
                  selectedTileColor: Colors.grey[300],
                  trailing: Icon(
                    index == _currentIndex && _isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
