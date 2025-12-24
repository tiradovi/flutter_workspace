import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/*
StatelessWidget = 정적인 위젯 페이지의 변화 없는 CSS 변경
StatefulWidget = 기능 있는 변화
 */
class IfScreen extends StatefulWidget {
  const IfScreen({super.key});

  @override
  /*
  State = 변하는 데이터를 관하는 상태 클래스
  IfScreen = IfScreen 이라는 위젯의 상태
  IfScreen 의 위젯 상태를 담당하는 클래스

  createState() = 상태를 만드는 함수

  플러터가 변수 관리와 화면그리기를 분리하여 앱관리를 유용하게 할 수 있도록 하는 기능
  State<IfScreen> createState() => return _IfScreenState(); 필수가 아니고
  한번에 하나의 class에서 작성 가능하나 추후 에러 발생
  변수 데이터 로직 꼬임, 변수와 화면을 분리함으로써
  매번 화면 ui를 호출해야하는 상황이 발생
  하지만 현재와 같이 상태와 ui를 분리하는 코드 작성시
  화면은 그대로 존재하는 채로 데이터만 변경되고 변경된 데이터가 반영된 상태로 화면 유지
   */
  State<IfScreen> createState() => /*return*/ _IfScreenState();
}

// 이 화면에서만 사용되는 class
class _IfScreenState extends State<IfScreen> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("if문 예제"),
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
              //모든 함수에서는 한줄 코드 작성시 {}생략 가능하나 다수 코드 작성시 {} 작성
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
                  number = number -1;
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
