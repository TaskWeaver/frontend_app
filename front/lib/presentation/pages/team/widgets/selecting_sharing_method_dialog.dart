import 'package:flutter/material.dart';
import 'package:front/presentation/pages/team/widgets/dialog.dart';
import 'package:front/presentation/pages/team/widgets/share_directly_dialog.dart';
import 'package:front/presentation/pages/team/widgets/share_via_qr_dialog.dart';
import 'package:go_router/go_router.dart';

class SelectingSharingMethodDialog extends StatelessWidget {
  final int teamId;

  SelectingSharingMethodDialog({
    required this.teamId,
    super.key,
  });

  final elevatedButtonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(16.0),
    alignment: Alignment.centerLeft,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero)),
    backgroundColor: const Color(0xFFD9D9D9),
    foregroundColor: Colors.transparent,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            style: elevatedButtonStyle,
            onPressed: () {
              context.pop();
              context.dialog(
                child: ShareDirectlyDialog(teamId: teamId),
              );
            },
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '직접 추가하기',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          ElevatedButton(
            style: elevatedButtonStyle,
            onPressed: () {
              context.pop();
              context.dialog(child: const ShareViaQRDialog());
            },
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'QR로 공유하기',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          TextButton(onPressed: () => context.pop(), child: const Text('닫기'))
        ],
      ),
    );
  }
}
