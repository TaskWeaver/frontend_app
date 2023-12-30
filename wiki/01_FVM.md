## flutter, dart 버전
- 해당 프로젝트의 flutter, dart 버전을 통일하기 위해 `fvm`을 사용하기로 했습니다.
- 간략한 사용방법은 다음과 같습니다.

1. fvm 다운로드
```bash
# fvm 다운로드(환경변수 추가가 필요합니다.)
dart pub global activate fvm
```

2. 버전 install
```bash
# 2023. 12. 30 기준 stable 버전입니다.
# 해당 세팅은 flutter 3.6=16.5 qjwjs, dart 3.2.3을 사용하게 됩니다.
fvm install 3.16.5
```
##### 참고
```bash
# 설치 가능한 버전 목록을 볼 수 있습니다.
fvm releases
```

3. 확인하기
```bash
fvm list
```

4. 사용하기
```bash
# 참고: flutter app directory에서 실행해야합니다.
fvm use 3.16.5
```

### 마무리
```bash
fvm flutter {command}
```
- 기존 flutter 명령어 앞에 fvm을 붙여서 사용하면 됩니다.