import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/basics/for_screen.dart';
import 'package:project/basics/if_screen.dart';
import 'package:project/screens/main_screen.dart';

import 'basics/mbti_intro_screen.dart';
import 'basics/mbti_question_screen.dart';
import 'basics/mbti_result_screen.dart'; // 구글에서 기본으로 제공하는 css 테마

/*
 * main.dart = 앱의 시작점
 * main_screen.dart = 메인 화면 조립
 * custom_app_bar = 상단 바
 * main_body = 본문 내용
 * custom_bottom_nav = 하단 메뉴
 * custom_fab = +버튼
 * custom_drawer = 사이드 메뉴
 */
/*
  flutter는 비공개 변수와 공개 변수를 _로 구분
  Private(_router) : 같은 파일 내에서만 접근 가능, 다른 파일에서는 이 변수 사용 불가
  Public(router) : 다른 파일에서도 import하면 접근 가능, 외부에 공개되는 변수
 */
// 아래 하위 코드에서 _router내부에 존재하는 데이터 수정불가 상수처리
// 외부에서 접근 불가능하게 설정  [router와 _router는 다른 상수]
final GoRouter _router = GoRouter(
  // 기본 메인 주소
  initialLocation: '/',
  /*
  builder : (context, state) => const MainScreen()
  builder = 화면 노출
  context = App에서 각화면의 위치 주소
  state = 현재 상태
   */
  routes: [
    GoRoute(path: "/", builder: (context, state) => const MainScreen()),
    GoRoute(path: "/if", builder: (context, state) => const IfScreen()),
    GoRoute(path: "/for", builder: (context, state) => const ForScreen()),
    GoRoute(path: "/mbti", builder: (context, state) => const MbtiIntroScreen()),
    GoRoute(path: "/mbti/question", builder: (context, state) => const MbtiQuestionScreen()),
    GoRoute(path: "/mbti/result", builder: (context, state) => const MbtiResultScreen()),
  ],
);

void main() {
  runApp(CustomIntroApp());
}

class CustomIntroApp extends StatelessWidget {
  const CustomIntroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'Flutter 기초 문법',
    );
  }
}
