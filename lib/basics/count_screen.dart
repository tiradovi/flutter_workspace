import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({super.key});

  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Count 예제"),
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('버튼을 눌러보세요'),
            SizedBox(height: 20),
            Text(
              '$number',
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  number = number + 1;
                });
              },
              child: Text('숫자 올리기'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  number = number - 1;
                });
              },
              child: Text('숫자 내리기'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  number = 0;
                });
              },
              child: Text('숫자 초기화'),
            ),
          ],
        ),
      ),
    );
  }
}
