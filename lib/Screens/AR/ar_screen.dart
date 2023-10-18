import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:audioplayers/audioplayers.dart';

class ARScreen extends StatelessWidget {
  final AudioPlayer player = AudioPlayer();

  Future<void> _playAudio(audioUrl) async {
    await player.play(UrlSource(audioUrl));
  }

  @override
  Widget build(BuildContext context) {
    final jet = Object(fileName: "assets/Airplane/Airplane.obj");
    jet.rotation.setValues(0, 90, 0);
    jet.updateTransform();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Airplane"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Cube(
              onSceneCreated: (Scene scene) {
                scene.world.add(jet);
                scene.camera.zoom = 10;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      _playAudio('assets/audio/plane.mp3');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 26, 238, 33),
                    ),
                    child: Text("Tên tiếng Anh"),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      _playAudio('assets/audio/plane_tv.mp3');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 219, 143, 29),
                    ),
                    child: Text("Tên tiếng Việt"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: ARScreen()));
