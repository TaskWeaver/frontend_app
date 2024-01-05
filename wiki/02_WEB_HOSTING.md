## web으로 빌드해서 파이어베이스에 deploy

### Build flutter project

1. package 설치
```bash
fvm flutter pub get
```

2. web으로 빌드
```bash
fvm flutter build web
```

### deploy to firebase
1. firebase 설치
```bash
npm install -g firebase-tools
```

2.firebase login
```bash
firebase login
```

3. firebase에 deploy
```bash
firebase deploy
```