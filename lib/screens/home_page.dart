import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Player App"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('audio_player_page');
              },
              child: const Text("Audio"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('video_player');
              },
              child: const Text("Video"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Carousel"),
            ),
          ],
        ),
      ),
    );
  }
}
