import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:ididid/pages/facts_page.dart';
import 'package:ididid/variables/global_varibles.dart';
import 'package:ididid/variables/my_colors.dart';
import 'package:ididid/widgets/bottom_bar.dart';

final GlobalKey<MainPageState> mainPageStateKey = GlobalKey<MainPageState>();

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: mainPageStateKey);

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  renew() {
    setState(() {});
  }

  int pageIndex = 0;

  open0() {
    setState(() {
      pageIndex = 0;
    });
  }

  open1() {
    setState(() {
      pageIndex = 1;
    });
  }

  open2() async {
    setState(() {
      pageIndex = 2;
    });
  }

  open3() {
    setState(() {
      pageIndex = 3;
    });
  }

  open4() {
    setState(() {
      pageIndex = 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyColors.background,
      child: Stack(
        children: [
          Column(children: [
            if (pageIndex == 0) FactsPage(),
            if (pageIndex == 1) const Spacer(),
            if (pageIndex == 2) const Spacer(),
            if (pageIndex == 3) const Spacer(),
            KeyboardVisibilityBuilder(
              builder: (context, isKeyboardVisible) {
                return Column(
                  children: [
                    if (!isKeyboardVisible)
                      MainBottomNavigationBar(
                        selectedIndex: pageIndex,
                        firstButtonPressed: () {
                          open0();
                        },
                        secondButtonPressed: () {
                          open1();
                        },
                        thirdButtonPressed: () {
                          open2();
                        },
                        forthButtonPressed: () {
                          open3();
                        },
                      ),
                  ],
                );
              },
            ),
          ]),
        ],
      ),
    );
  }
}
