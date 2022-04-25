import 'package:flutter/material.dart';

class AudioPlayer extends StatefulWidget {
  const AudioPlayer({Key? key}) : super(key: key);

  @override
  State<AudioPlayer> createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Audio Player Page"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){Navigator.of(context).pushNamed('asset_audio_player');}, child: const Text("Asset Audio"),),
            ElevatedButton(onPressed: (){Navigator.of(context).pushNamed('network_audio_player');}, child: const Text("Network Video"),),
          ],
        ),
      ),
    );
  }
}
