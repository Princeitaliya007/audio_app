import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class AssetAudioPlayer extends StatefulWidget {
  const AssetAudioPlayer({Key? key}) : super(key: key);

  @override
  State<AssetAudioPlayer> createState() => _AssetAudioPlayerState();
}

class _AssetAudioPlayerState extends State<AssetAudioPlayer> {
  final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  String? totalduration;
  String? currentposition;

  double totaldurationinseconds = 0;
  double currentpositioninseconds = 0;

  bool isplay = true;

  List images = [
    'https://static.radio.fr/images/broadcasts/cb/ef/2075/c300.png',
    'https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg'
  ];

  @override
  void initState() {
    super.initState();

    assetsAudioPlayer.open(
      Playlist(audios: [
        Audio(
          "assets/audio/kgf2.mp3",
          metas: Metas(
            id: 'Rock',
            title: 'Rock',
            artist: 'Florent Champigny',
            album: 'RockAlbum',
            image: const MetasImage.network(
                'https://static.radio.fr/images/broadcasts/cb/ef/2075/c300.png'),
          ),
        ),
        Audio("assets/audio/audio1.mp3", metas: Metas(
          id: 'Country',
          title: 'Country',
          artist: 'Florent Champigny',
          album: 'CountryAlbum',
          image: const MetasImage.asset('https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg'),
        ),),
      ]),
      autoStart: false,
      // loopMode: LoopMode.playlist,
      showNotification: true,
      notificationSettings: NotificationSettings(
        customStopIcon: AndroidResDrawable(name: "ic_stop_custom"),
        customPauseIcon: AndroidResDrawable(name: "ic_pause_custom"),
        customPlayIcon: AndroidResDrawable(name: "ic_play_custom"),
        customPrevIcon: AndroidResDrawable(name: "ic_prev_custom"),
        customNextIcon: AndroidResDrawable(name: "ic_next_custom"),
      ),
    );

    assetsAudioPlayer.current.listen((Playing? play) {
      setState(() {
        totalduration = play!.audio.duration.toString().split(".")[0];
        totaldurationinseconds = play.audio.duration.inSeconds.toDouble();
      });
    });

    assetsAudioPlayer.currentPosition.listen((Duration? duration) {
      setState(() {
        currentposition = duration.toString().split(".")[0];
        currentpositioninseconds = duration!.inSeconds.toDouble();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Asset Audio Player"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(images[0]),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () async {
                    await assetsAudioPlayer.previous();
                  },
                  icon: const Icon(Icons.skip_previous),
                ),
                IconButton(
                  onPressed: () {
                    (isplay)
                        ? assetsAudioPlayer.play()
                        : assetsAudioPlayer.pause();
                    setState(() {
                      isplay = !isplay;
                    });
                  },
                  icon: (isplay)
                      ? const Icon(Icons.play_arrow)
                      : const Icon(Icons.pause),
                ),
                IconButton(
                  onPressed: () async {
                    await assetsAudioPlayer.stop();
                  },
                  icon: const Icon(Icons.stop),
                ),
                IconButton(
                  onPressed: () async {
                    await assetsAudioPlayer.next();
                  },
                  icon: const Icon(Icons.skip_next),
                ),
              ],
            ),
            Slider(
                value: currentpositioninseconds,
                min: 0,
                max: totaldurationinseconds,
                onChanged: (val) {
                  currentpositioninseconds = val;
                  assetsAudioPlayer.seek(Duration(seconds: val.toInt()));
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  width: 150,
                ),
                Text(
                  "$currentposition/$totalduration",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
