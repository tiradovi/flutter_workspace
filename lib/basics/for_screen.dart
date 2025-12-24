import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForScreen extends StatefulWidget {
  const ForScreen({super.key});

  @override
  State<ForScreen> createState() => _ForScreenState();
}

class _ForScreenState extends State<ForScreen> {
  // dart 으로 js와 같은 기능 관련 작성


  // UI 관련 작성
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("for문 예제"),
        backgroundColor: Colors.yellow,
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon:  Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('반복문 화면'),
          ],
        ),
      ),
    );
  }
}
