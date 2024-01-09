## pr을 올렸는데, commit lint가 어긋난 경우 해결법
1. 먼저 push전 상태로 만들기
- github pr 삭제
- local에서 `git remote update`

2. git rebase 이용하기
- `git rebase -i ${브랜치 이름}`

3. vim에서 commit 다시 조정하기
- `pick [commitId] [commit메시지]`로 되어있고, 하단에 설명이 친절하게 나와 있다.
- 자주쓰는 것만 살펴보자
    ```
        pick -> 기존과 달라지는게 없다.
        reword -> 커밋 메시지만 변경한다.
        edit -> 커밋 메시지도 바꾸고, 커밋 파일도 바꾼다.
        squash -> 커밋을 이전 커밋과 합친다.
    ```

4. git log로 정상적으로 동작했는지 확인하고 재도전해보자!

