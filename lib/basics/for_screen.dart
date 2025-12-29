import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// dart언어는 java + javaScript + C++에서 유용하다고 생각한 예약어와 기능을 조합한 언어
class ForScreen extends StatefulWidget {
  const ForScreen({super.key});

  @override
  State<ForScreen> createState() => _ForScreenState();
}

class _ForScreenState extends State<ForScreen> {
  // dart 으로 js와 같은 기능 관련 작성, 변수 및 함수 선언 가능
  List<String> items = ['사과', '바나나', '포도', '수박', '딸기'];

  // UI 관련 작성, 변수,함수선언 불가
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("for문 예제"),
        backgroundColor: Colors.yellow,
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('반복문 화면'),

              // dart 언어는 중간중간 기능에 관련된 코드를 기술할 수 있다.
              // for 문은 java에서 사용하는 for문과 동일
              for (int i = 0; i < 5; i++)
                // 자바에서는 for문 관련 출력을 System.out.println() 출력문 확인
                // Dart의 경우 UI 관련된 프레임 워크이기 때문에
                // Container와 같은 UI 관련된 클래스로 화면에서 데이터 확인
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  color: Colors.grey[200],
                  child: Text('숫자인덱스: $i'),
                ),
              // 구분선 (상위 클래스와의 높이, 가로한줄의 굵기)
              Divider(height: 40, thickness: 20, color: Colors.yellow[200]),
              Text('리스트 데이터 반복문 = 숫자가 아닌 리스트에 작성된 문자열 데이터 반복하여 출력'),

              // 리스트 데이터를 이용한 반복문 (for-in)
              // Controller에서 List<Product> 데이터를 전달받은경우
              // 프론트에서 map 대신 사용
              for (var item in items)
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(40),
                  child: Text("과일이름 : $item"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
