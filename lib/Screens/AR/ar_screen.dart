import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:audioplayers/audioplayers.dart';

class ARScreen extends StatelessWidget {
  final AudioPlayer player = AudioPlayer();

  Future<void> _playAudio(String audioFileName) async {
    await player.play('assets/audio/$audioFileName' as Source);
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
                  width: 150, // Chiều rộng của nút
                  child: ElevatedButton(
                    onPressed: () {
                      _playAudio("plane.mp3");
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Màu nền của nút khi không được nhấn vào
                    ),
                    child: Text("Tên tiếng Anh"),
                  ),
                ),
                SizedBox(
                  width: 150, // Chiều rộng của nút
                  child: ElevatedButton(
                    onPressed: () {
                      _playAudio("plane_tv.mp3");
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange, // Màu nền của nút khi không được nhấn vào
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
