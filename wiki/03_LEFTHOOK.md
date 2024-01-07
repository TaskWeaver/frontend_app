## 왜 사용하나요?
- 우리가 정한 flutter의 lint가 프로젝트에 항상 적용된 상태로 유지되도록 하기 위함입니다.
- lint 설정은 IDE에 warning, error를 표시해주지만 자동으로 고쳐주거나 commit전에 확인해주지는 않습니다.
- lefthook을 사용해서 commit할 때 확인하도록 자동화합니다.

## 설치
- node가 있으면,
```
npm install -g @arkweid/lefthook
```

- mac 유저는,
```
brew install lefthook
```

- 그 외는 다음 문서를 참고해주세요.
[설치 가이드](https://github.com/evilmartians/lefthook/blob/master/docs/install.md)


## 사용
- `lefthook.yml`파일에 git의 특정 이벤트에 실행할 쉘 스크립트를 작성할 수 있습니다.

## 테스트해보기
```
lefthook run pre-commit
lefthook run pre-push
```

## yml 작성하기
- [docs](https://github.com/evilmartians/lefthook/blob/master/docs/configuration.md)
