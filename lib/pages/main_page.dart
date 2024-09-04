import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:ididid/demo/boxing_facts/boxing_repository.dart';
import 'package:ididid/pages/facts_page.dart';
import 'package:ididid/variables/global_varibles.dart';
import 'package:ididid/variables/my_colors.dart';
import 'package:ididid/widgets/bottom_bar.dart';

import '../demo/boxing_facts/fact_widget.dart';

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
    return const Scaffold(
      body: Center(
        child: FactWiget(
            imageName: Images.fact02,
            factNumber: 'Fact 2',
            title: 'Boxing Was An Established Sport In Ancient Greece',
            description:
                'Here’s an interesting boxing fact.As with many other sports, boxing as a formal sport has its roots in Ancient Greece.This ancient Greek boxing was known as Pygmachia.In fact, it existed as an Olympic sport as early as 688 BCE.ancient greek ceramic vessels depicting boxers The rules are however different from modern boxing that we know and love. Here are some of the rules. There were no time limits or rounds but rather the victor was decided if the opponent gave up or if he was incapacitated. There was no weight class in this sport and no ring either.Here’s a fun fact: the first winner of Olympic boxing was a man named Onomastus of Smyrna who was also the person who wrote the rules of ancient Greek boxing.'),
      ),
    );
  }
}
