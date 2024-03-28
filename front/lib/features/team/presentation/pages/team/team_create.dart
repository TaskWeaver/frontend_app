import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/app/domain/presentation/login/component/hinted_textfield.dart';
import 'package:front/app/locator.dart';
import 'package:front/features/team/presentation/pages/team/widgets/dialog.dart';
import 'package:go_router/go_router.dart';

class TeamCreateScreen extends ConsumerStatefulWidget {
  const TeamCreateScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TeamCreateScreen> createState() => _TeamCreateScreenState();
}

class _TeamCreateScreenState extends ConsumerState<TeamCreateScreen> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'TeamW2aver',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            Column(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: OvalBorder(),
                  ),
                ),
                const Text(
                  '알림',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Team 만들기',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 16,
              width: double.infinity,
            ),
            const Text(
              '새로운 팀을 만들어보세요',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 16,
              width: double.infinity,
            ),
            HintedTextField(
                controller: textController,
                hintText: '',
                title: '팀 이름',
                onSaved: (_) {},
                validator: (_) => null),
            const SizedBox(
              height: 64,
              width: double.infinity,
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  final result = await createTeamUseCase.call(
                      name: textController.text.trim());

                  await result.fold(
                    onSuccess: (value) {
                      return context.dialog<String>(
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('팀 생성이 완료되었습니다. 팀을 초대하여 보세요'),
                              // Text(t.dialog.teamCreationComplete),
                              TextButton(
                                onPressed: () {
                                  context.pop();
                                  context.pop();
                                },
                                child: Text('닫기'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    onFailure: (e) {},
                  );
                },
                child: const Text(
                  '생성',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
