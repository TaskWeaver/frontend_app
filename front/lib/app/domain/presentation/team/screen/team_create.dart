import 'package:flutter/material.dart';
import 'package:front/app/domain/presentation/user/component/hinted_textfield.dart';
import 'package:front/app/domain/presentation/team/componet/dialog.dart';
import 'package:front/i18n/strings.g.dart';
import 'package:go_router/go_router.dart';

class TeamCreateScreen extends StatelessWidget {
  const TeamCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = Translations.of(context).teamCreateScreen;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              t.appbar.appBarTitle,
              style: const TextStyle(
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
                Text(
                  t.appbar.notification,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
            Text(
              t.screen.createTeamTitle,
              style: const TextStyle(
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
            Text(
              t.screen.createTeamSubtitle,
              style: const TextStyle(
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
            //Todo: HintedTextField 폼 교체하기
            HintedTextField(
                hintText: '',
                title: t.screen.teamNameHint,
                onSaved: (_) {},
                validator: (_) => null),
            const SizedBox(
              height: 64,
              width: double.infinity,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  context.dialog<String>(
                      child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(t.dialog.teamCreationComplete),
                          TextButton(
                              onPressed: () {
                                context.pop();
                              },
                              child: Text(t.dialog.closeButton))
                        ]),
                  ));
                },
                child: Text(
                  t.screen.createButton,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
