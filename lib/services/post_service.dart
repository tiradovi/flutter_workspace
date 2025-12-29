import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/Post.dart';

class Postservice {
  static String baseUrl = 'http://localhost:9000';

  // 이미지 url 만들기
  static String getImageUrl(String path) {
    return "${baseUrl}/api$path";
  }

  // 어플에서는 백엔드에서 데이터를 가져온다는 것이 기본 세팅은 아님
  // 백엔드 연결 없이 핸드폰 내부에 localstorage 처럼 데이터 저장 공간을 만들어서
  // 소비자가 데이터를 관리하고, 핸드폰에서 제공하는 게임이나 todoList와 같은 작업을 하는
  // 어플이 기본 설정
  // 게시물 백엔드에서 어플로 가져오기
  // springboot나 dart는 dependencies에 http나 web연결 관련된 모듈 설치 필요
  // http의 import가 보이지 않는 경우 pubspec.yaml에 dependencies확인 필요
  static Future<List<Post>> getPosts() async {
    debugPrint('API 호출 시작 : $baseUrl/api/posts');

    var res = await http.get(Uri.parse('$baseUrl/api/posts'));
    debugPrint('응답 상태 코드 : ${res.statusCode}');

    if (res.statusCode == 200) {
      List jsonList = json.decode(utf8.decode(res.bodyBytes));

      debugPrint('데이터 개수 : ${jsonList.length}');
      debugPrint('전체 데이터 : ${jsonList}');

      return jsonList.map((j) => Post.fromJson(j)).toList();
    } else {
      throw Exception('데이터 불러오기 불가');
    }
  }
}
