import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Xylophone'),
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
          child: PlayMusic(),
        ),
      ),
    );
  }
}

class PlayMusic extends StatefulWidget {
  const PlayMusic({Key? key}) : super(key: key);

  @override
  State<PlayMusic> createState() => _PlayMusicState();
}
final player = AudioPlayer();
Expanded playSound(Color color, int nodeNumber)
{
  return Expanded(
    child: TextButton(
      onPressed: () async{
        player.setVolume(1);
        player.play(AssetSource('note$nodeNumber.wav'));
      },
      child: Text(''),
      style: ButtonStyle(
        backgroundColor:
        MaterialStateColor.resolveWith((states) => color),
        enableFeedback: false,
      ),
    ),
  );
}

class _PlayMusicState extends State<PlayMusic> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        playSound(Colors.red, 1),
        playSound(Colors.blue, 2),
        playSound(Colors.yellow, 3),
        playSound(Colors.green, 4),
        playSound(Colors.purple, 5),
        playSound(Colors.orange, 6),
        playSound(Colors.grey, 7),
      ],
    );
  }
}
