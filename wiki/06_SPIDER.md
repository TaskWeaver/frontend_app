## Spider 을 이용한 이미지 파일 관리

SPIDER 패키지는 이미지 파일 경로를 객체로 만들어 관리하기 쉽게 만듭니다.

### Before
```dart
Widget build(BuildContext context) {
  return Image(image: AssetImage('assets/background.png'));
}
```

### After
```dart
Widget build(BuildContext context) {
  return Image(image: AssetImage(Assets.background));
}
```

## 설치
1. Installation 
```bash
dart pub global activate spider
```

2. Create Configuration File
```bash
spider create
```

## 코드 생성
assets 폴더에 이미지를 넣고
```bash
spider build
```
를 입력하면 자동으로 코드를 구성합니다.

