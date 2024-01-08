# 폴더 구조

```
assets 
  - fonts
  - html
  - i18n
  - images
  - icons
  - videos

lib
  - shared
     - atom : 디자인된 widget
     - helper : 자주 사용되는 mixin
     - utils : 범용적으로 사용될 수 있는 함수, 클래스
     - wrapper : 타 라이브러리 wrapper
  - core
     - config : core 내에서 사용되는 config (통신 관련)
     - const : core 내에서 사용되는 constance
     - utils: core 내에서 사용되는 utils
     - [domain이름]
       - data : entity, repositories
       - domain : models, usecase
  - app
     - config : theme, routes 등 빌드 시점에 결정된 고정값
     - const : app 내에서 사용되는 constance
     - presentation
        - [page이름] : state, view, viewModel, screen
     
  - main // 
    - dev, test, stage, live에 따라 분기 처리 담당

```