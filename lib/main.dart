import 'package:audio_player/screens/asset_audio_player.dart';
import 'package:audio_player/screens/audio_player.dart';
import 'package:audio_player/screens/home_page.dart';
import 'package:audio_player/screens/network_audio_player.dart';
import 'package:audio_player/screens/video_player.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context)=> const HomePage(),
        'audio_player_page' : (context)=> const AudioPlayer(),
        'asset_audio_player' : (context)=> const AssetAudioPlayer(),
        'network_audio_player' : (context)=> const NetworkAudioPlayer(),
        'video_player' : (context)=>  const VideoPlayerPage(),
      },
    ),
  );
}