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
  int likeCount = 0;

  // 함수 : 좋아요 버튼을 눌렀을 때 실행 [Dart언어는 영어와 숫자만 가능]
  void likeButton() {
    setState(() {
      likeCount = likeCount + 1;
    });
  }

  // 함수 : 리셋 버튼
  void resetButton(){
      setState(() {
        likeCount = 0;
      });
  }

  // react에서는 return 전에 js 기능 작성
  // dart에서는 Widget 전에 dart언어로 기능에 대하여 작성할 수 있다.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("if문 예제"),
        backgroundColor: Colors.blue,
        leading: IconButton(
          /*익명함수이면서 {}생략시 =>사용*/
          onPressed: () => context.go('/'),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '하트를 눌러주세요.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Text(
              '$likeCount',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            //IF 문을 활용하여 조건에 따라 다른 메세지 표시
            if (likeCount == 0)
              Text(
                '아직 좋아요가 없습니다.😔',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              )
            else if (likeCount < 5)
              Text(
                '좋아요를 눌러주셔서 감사합니다.😚',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              )
            else
              Text(
                '인기 폭발!😀',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: likeButton,
              //child: Icon(Icons.favorite, color: Colors.pink), 스타일이 하나일 경우에는 style: 묶은 형태로 작성하지 않고 단일로 작성가능
              child: Icon(Icons.favorite, color: Colors.pink),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: resetButton,
              child: Text('초기화', style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
