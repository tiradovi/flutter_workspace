import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WhileScreen extends StatefulWidget {
  const WhileScreen({super.key});

  @override
  State<WhileScreen> createState() => _WhileScreenState();
}

class _WhileScreenState extends State<WhileScreen> {
  /*
  예제 1번: 생성자에서 필수 매개 변수를 사용하지 않고,
  일반적으로 데이터를 전역변수에 추가하는 방법
   */
  int count = 0;

  void runWhile() {
    int temp = 0;
    while (temp < 5) {
      temp++;
    }
    setState(() {
      count = temp;
    });
  }

  /*
  예제 2번 : initState 를 사용하여 생성자를 통하여
  데이터를 전역변수에 추가하는 방법
   */
  int initCount = 0;

  /*
  initState = 위젯이 생성될 때 한 번만 실행되는 초기화 메서드
  용도 = API 호출, 리스너 등록, 컨트롤러 초기화 등 초기 작업 설정 시 사용
  카운트와 같은 형태에서는 사용하지 않음

  클릭했을 때 값 변동의 경우에는 예제 1번 사용하기
   */
  @override
  void initState() {
    super.initState();

    while (initCount < 3) {
      debugPrint('initCount : ${initCount}');
      initCount++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("while문 예제"),
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: runWhile,
              child: Text('1번 방법 while 실행하기'),
            ),
            Text('Count : $count'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: initState,
              child: Text('2번 방법 while 실행하기'),
            ),
            SizedBox(height: 20),
            Text('버튼 클릭 없이 init Count 출력 --> 가능'),
            Text('initCount = $initCount'),
            Text('버튼 클릭 으로 init Count 출력 --> 불가능'),
            Text('initCount = $initCount'),
          ],
        ),
      ),
    );
  }
}
