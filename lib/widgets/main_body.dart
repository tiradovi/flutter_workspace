import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '기초 문법 연습장',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => context.go("/if"),
            child: const Text(
              'IF 문 배우기',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => context.go("/for"),
            child: const Text(
              'FOR 문 배우기',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => context.go("/count"),
            child: const Text(
              'Count문을 통한 StatefulWidget 배우기',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => context.go("/while"),
            child: const Text(
              'While 문 배우기',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => context.go("/insta-main"),
            child: const Text(
              'Instagram 이동',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
