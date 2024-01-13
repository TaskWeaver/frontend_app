## DartDoc을 이용한 문서 파일 작성

1. `dartdoc_options.yaml` 파일 작성
    - flutter 프로젝트 폴더에 `dartdoc_options.yaml` 파일을 생성합니다.
    - `dartdoc_options.yaml` 파일에 아래와 같이 작성합니다.
    
    ```yaml :
    dartdoc:
      nodoc: ['lib/config/**', 'lib/domain/**']
      categories:
        "Architecture":
          markdown: lib/topics/architecture.md
        "Component":
          markdown: lib/topics/component.md
      categoryOrder:
        - "Architecture"
        - "Component"
    
    ```
    
2. 토픽 마크다운 작성
    - `lib/topics` 폴더에 토픽 문서를 마크다운 형식으로 작성합니다.
3. 카테고리 적용
    - 코드 내에서 카테고리를 한 번 이상 불러와야 문서에 나타납니다.
    - 코드 내에서 카테고리를 불러오려면 `/// {@category 카테고리이름}`을 입력합니다.
    - 문서 주석은 슬래시 3개로 시작되는 주석으로, 슬래시 2개로 시작되는 주석과 달리 DartDoc 산출물에 표시됩니다.
    
    예시:
    
    ```dart :
    /// {@category Architecture}
    void main() async {
      runApp(const MyApp());
    }
    
    ```
    
4. 문서 주석 작성
    - 코드 내에서 DartDoc을 작성할 때는 다음과 같은 형식을 따릅니다.
    
    ```dart :
    /// {@category (카테고리 이름)}
    /// 내용 작성
    class ExampleWidget extends StatefulWidget {
      const ExampleWidget({Key? key}) : super(key: key);
    
      @override
      State<ExampleWidget> createState() => ExampleWidgetState();
    }
    
    ```
    
    예시:
    
    ```dart :
    /// {@category Screen}
    /// 로그인 화면 [LoginScreenState]
    /// - Project: <http://www.groupware.com/projectnumber>
    /// - Design: <http://www.designaddress.com/projectnumber>
    /// - Specification: <http://www.specandwireframe.com/projectnumber>
    /// ***
    /// # Dev TC
    /// #### [o] ID 란에 이메일 주소 입력이 되는가
    /// #### [x] ID 입력조건(xxx@xxx.xxx 이메일 주소 형태)에 따라 Validation이 되는가
    /// #### [o] PW 란에 비밀번호 입력이 되는가
    /// #### [o] PW를 입력할 때 숨김처리가 되는가
    /// #### [o] PW 입력조건(8자 이상)에 맞지 않는 경우 에러메세지가 노출되는가
    /// #### [o] Sign in 버튼을 눌러 로그인 처리가 되고 이전 화면으로 돌아가는가
    class LoginScreen extends StatefulWidget {
      const LoginScreen({Key? key}) : super(key: key);
    
      @override
      State<LoginScreen> createState() => LoginScreenState();
    }
    
    ```

5. 실행

  - 모든 문서주석을 작성하였다면 터미널에 아래 코드를 입력하여 가시적인 웹 문서로 생성할 수 있습니다.

   flutter pub global run dartdoc:dartdoc

6. 보기 

  - ./doc/api/index.html 에서 생성한 웹 문서를 보실 수 있습니다.