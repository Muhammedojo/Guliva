import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:guliva/core/utils/ui_state.dart';
import 'package:guliva/core/utils/utils.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  final audioPlayer = AudioPlayer();
  Duration? duration;
  Duration? position;
  PlayerState playerState = PlayerState.stopped;
  bool isPlaying = false;
  int currentIndex = 0;

  List<String> audioUrls = [
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    "https://filesamples.com/samples/audio/mp3/sample1.mp3",
    "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3",
  ];

  @override
  void initState() {
    super.initState();
    initAudioPlayer();
  }

  Future<void> initAudioPlayer() async {
    audioPlayer.onDurationChanged.listen((d) => setState(() => duration = d));
    audioPlayer.onPositionChanged.listen((p) => setState(() => position = p));
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() => playerState = state);
      if (state == PlayerState.completed) onNext();
    });
  }

  Future<void> playAudio(String url) async {
    await audioPlayer.play(UrlSource(url));
    setState(() => isPlaying = true);
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
    setState(() => isPlaying = false);
  }

  void onAudioSelected(int index) {
    if (currentIndex != index) {
      setState(() {
        currentIndex = index;
        isPlaying = false;
        position = Duration.zero;
      });
      playAudio(audioUrls[currentIndex]);
    }
  }

  void onNext() {
    if (currentIndex < audioUrls.length - 1) {
      onAudioSelected(currentIndex + 1);
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.deepPurple],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/soup.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 50,
                        icon: Icon(
                          isPlaying ? Icons.pause_circle : Icons.play_circle,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          if (isPlaying) {
                            pauseAudio();
                          } else {
                            playAudio(audioUrls[currentIndex]);
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 4,
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 8),
                        thumbColor: Colors.white,
                        activeTrackColor: Colors.white70,
                        inactiveTrackColor: Colors.white30,
                      ),
                      child: Slider(
                        value: (position?.inMilliseconds ?? 0) /
                            (duration?.inMilliseconds ?? 1),
                        onChanged: (value) {
                          audioPlayer.seek(Duration(
                              milliseconds:
                                  (duration!.inMilliseconds * value).toInt()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: audioUrls.length,
                itemBuilder: (context, index) {
                  bool isCurrentPlaying = index == currentIndex && isPlaying;
                  return ListTile(
                    tileColor: isCurrentPlaying
                        ? Colors.orange
                        : index == currentIndex
                            ? Colors.purple.shade200
                            : Colors.transparent,
                    leading: Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 16,
                        color: isCurrentPlaying ? Colors.black : Colors.white,
                        fontWeight: isCurrentPlaying
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    title: Text(
                      'Audio ${index + 1}',
                      style: TextStyle(
                        color: isCurrentPlaying ? Colors.black : Colors.white,
                        fontWeight: isCurrentPlaying
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    onTap: () => onAudioSelected(index),
                    trailing: Icon(
                      isCurrentPlaying ? Icons.pause : Icons.play_arrow,
                      color: isCurrentPlaying ? Colors.black : Colors.white,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
