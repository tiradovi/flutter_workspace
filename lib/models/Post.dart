/*
아래와 같이 class
Post({required this.postId}
factory Post.fromJson(Map<String, dynamic> json){}
이 기본 정의

1번 방법:
JSON to Dart 플러그인
파일 -> 설정 -> 플러그인 -> Marketplace -> JSON to Dart 설치
lib/models 우클릭 -> new -> Dart Model from JSON-> 클래스 입력 후
JSON 데이터 붙여넣기 {} 만 자동으로 파일 완성

2번 방법:
Dart Data Class Generator -> 인텔리제이 자동으로 사용하는 플러그인 설정
생성자로 작성하기
필드만 작성 ->(window) Alt + insert -> 생성자 -> 전부 선택

3번 방법:
라이브 템플릿 사용하여 직접 생성
*/
class Post {
  int postId;
  int userId;
  String postImage;
  String postCaption;
  String postLocation;
  String createdAt;
  String userName;
  String userFullname;
  String userAvatar;
  int likeCount;
  int commentCount;

  /*
  자바에서는 매개변수 개수와 자료형만 다르면 클래스명칭의 생성자를 다수 생성가능
  Dart에서는 동일한 명칭의 생성자를 다수 생성 불가, 생성자마다 명칭을 다르게 작성해야함

  이름을 붙이는 방법은 ".하위명칭" 형태로 작성 명칭은 개발자가 원하는 대로 작성 후 사용
  Post.withDefaults
  Post.dummy

  사용 예시
  Post p1 = Post(postId:1, userId;100,...)
  Post p2 = Post.withDefaults(postId:1)

  보통은 필수 매개변수 생성자만 사용
   */
  // 필수 매개변수 생성자
  Post({
    required this.postId,
    required this.userId,
    required this.postImage,
    required this.postCaption,
    required this.postLocation,
    required this.createdAt,
    required this.userName,
    required this.userFullname,
    required this.userAvatar,
    required this.likeCount,
    required this.commentCount,
  });

  // 생성자에서 특정 변수 명칭에는 기본값을 개발자가 작성
  Post.withDefault({
    this.postId = 0,
    this.userId = 0,
    this.postImage = '',
    this.postCaption = '',
    this.postLocation = '',
    this.createdAt = '',
    this.userName = '',
    this.userFullname = '',
    this.userAvatar = '',
    this.likeCount = 0,
    this.commentCount = 0,
  });

  // 선택적 생성자 모든 변수 데이터의 값을 추가하거나 넣어놓지 않아도 되는 생성자
  // 변수이름에 ? 체이닝으로 에러 최소화
  /*
  int? postId;
  int? userId;
  String? postImage;
  String? postCaption;
  String? postLocation;
  String? createdAt;
  String? userName;
  String? userFullname;
  String? userAvatar;
  int? likeCount;
  int? commentCount;

  Post.optional({
     this.postId,
     this.userId,
     this.postImage,
     this.postCaption,
     this.postLocation,
     this.createdAt,
     this.userName,
     this.userFullname,
     this.userAvatar,
     this.likeCount,
     this.commentCount,
  });  */

  // fromJson은 백엔드에서 가져온 데이터를 dart에 보여주는 형식
  // toJson은 어플에서 백엔드로 데이터를 저장할 때 사용하는 형식
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postId'],
      userId: json['userId'],
      postImage: json['postImage'],
      postCaption: json['postCaption'],
      postLocation: json['postLocation'],
      createdAt: json['createdAt'],
      userName: json['userName'],
      userFullname: json['userFullname'],
      userAvatar: json['userAvatar'],
      likeCount: json['likeCount'],
      commentCount: json['commentCount'],
    );
  }
}
