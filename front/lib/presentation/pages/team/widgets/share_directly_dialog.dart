import 'package:flutter/material.dart';
import 'package:front/app/locator.dart';
import 'package:front/features/data/models/invite_team.dart';
import 'package:go_router/go_router.dart';

class ShareDirectlyDialog extends StatelessWidget {
  final int teamId;

  const ShareDirectlyDialog({
    required this.teamId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    String email = '';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('직접 추가하기'),
          const SizedBox(
            height: 24,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('아이디로 추가'),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey[300],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {

                      final result = await inviteTeamByEmailUseCase.call(
                        inviteTeam: InviteTeam(
                          email: controller.text.trim(),
                          team_id: teamId,
                        ),
                      );
                      await result.fold(onSuccess: (value) {
                        print('value $value');
                      }, onFailure: (e) {
                        print('fail $e');
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('초대 링크로 공유'),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey[300],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero),
                      ),
                    ),
                    child: const Text('📎'),
                  ),
                ],
              ),
            ],
          ),
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('닫기'),
          ),
        ],
      ),
    );
  }
}
