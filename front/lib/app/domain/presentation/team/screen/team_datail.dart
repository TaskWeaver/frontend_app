import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TeamDetailScreen extends StatelessWidget {
  TeamDetailScreen({super.key});

  final elevatedButtonStyle = ElevatedButton.styleFrom(
    padding: EdgeInsets.all(16.0),
    alignment: Alignment.centerLeft,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
    backgroundColor: Color(0xFFD9D9D9),
    foregroundColor: Colors.transparent,
  );

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
      color: Colors.black,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      height: 0,
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
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
                Text(
                  '알림',
                  textAlign: TextAlign.center,
                  style: textStyle.copyWith(fontSize: 15),
                ),
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '팀이름 의 Board',
              style: textStyle.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Team Member (팀원 수)',
                  style: textStyle.copyWith(fontSize: 15),
                ),
                TextButton(onPressed: () => context.dialog(child: SelectingSharingMethodDailog()), child: const Text('share'))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemExtent: 48,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFD9D9D9),
                          shape: OvalBorder(),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    scrolledUnderElevation: 0.0,
                    automaticallyImplyLeading: false,
                    pinned: true,
                    titleSpacing: 0.0,
                    title: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0, top: 8.0),
                        child: Text(
                          'Team Project',
                          style: textStyle.copyWith(fontSize: 15),
                        )),
                  ),
                  SliverList.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: elevatedButtonStyle,
                          child: Text(
                            '프로젝트 이름',
                            style: textStyle.copyWith(fontSize: 15),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
