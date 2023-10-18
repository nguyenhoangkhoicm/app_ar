import 'package:flutter/material.dart';
import '../AR/ar_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AR Learning',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroductionScreen(),
    );
  }
}

class IntroductionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AR Learning'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/home.png', // Đường dẫn đến hình ảnh của bạn
              width: 200, // Chiều rộng của hình ảnh
              height: 200, // Chiều cao của hình ảnh
              fit: BoxFit.cover, // Định dạng hình ảnh để vừa vào khung
            ),
            SizedBox(height: 20),
            Text(
              'Chào mừng bạn đến với không gian AR !',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Điều hướng tới trang chính khi nhấn nút "Đăng nhập"
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ARScreen(); // Thay thế HomeScreen() bằng tên của trang chính của bạn
                    },
                  ),
                );
              },
              child: Text('Bắt Đầu'),
            ),
          ],
        ),
      ),
    );
  }
}
