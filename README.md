# GIT 활용하기

## github issue, pr tempalte
- `.github` 폴더 내에 있는 `ISSUE_TEMPLATE`, `PULL_REQUEST_TEMPLATE`을 통해 협업을 관리합니다.
- 이슈를 작성하고, 멤버를 할당한 뒤 이슈 이름으로 브랜치를 만들어 PR을 요청합니다.
- PR은 assign된 인원 중 과반수가 찬성하면 main으로 merge 합니다.

## github action
- `.github/workflows` 폴더 내에 github action들을 관리합니다.
- 기본으로 commit 메시지 규칙 githubaction을 달아두었습니다.
- 권장
    - 배포 자동화
    - PR main올 merge할 때 테스트 실행
    - 에셋 관리
    - PR올릴 때 commit 메시지 관리하기

## commintlint
- [참고](https://commitlint.js.org/#/reference-rules)
- `develop-rule`
- husky를 같이 사용하는 것도 참고해보세요


## doc
- 코드에 대한 문서는 `javadoc`, `dartdoc`을 선택
    : [참고](https://johngrib.github.io/wiki/java/javadoc/)
- 프로젝트 진행 중 이슈에 대한 자세한 문서는 `wiki`
- `ReadMe` > `doc/*` > `wiki` 순으로 자세히 작성한다고 생각하면 좋을 것 같습니다.

## *.example 파일(참고)
- `.gitignore`으로 숨겨두는 파일의 경우 `*.example`파일을 만들어 public으로 오픈해두면 프로젝트를 훑어보는 사람에게 도움이 됩니다.