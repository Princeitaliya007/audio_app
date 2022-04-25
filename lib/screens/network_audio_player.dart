import 'package:flutter/material.dart';

class NetworkAudioPlayer extends StatefulWidget {
  const NetworkAudioPlayer({Key? key}) : super(key: key);

  @override
  State<NetworkAudioPlayer> createState() => _NetworkAudioPlayerState();
}

class _NetworkAudioPlayerState extends State<NetworkAudioPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Network Audio Player"),
      ),
    );
  }
}
