

import 'package:flutter/material.dart';
import 'package:ididid/variables/global_varibles.dart';
import 'package:ididid/variables/my_colors.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.firstButtonPressed,
    required this.secondButtonPressed,
    required this.thirdButtonPressed,
    required this.forthButtonPressed,
  }) : super(key: key);

  final int selectedIndex;

  final Function firstButtonPressed;
  final Function secondButtonPressed;
  final Function thirdButtonPressed;
  final Function forthButtonPressed;

  @override
  Widget build(BuildContext context) {


return Column(
  children: [
    Container(height: 0.5, color: Colors.grey.withOpacity(0.5),),
        Container(
                height: h/w > 2 ? 83 : 65,
                // margin: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                padding: const EdgeInsets.fromLTRB(32, 8, 32, 0),
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: const Color(0xff0E0814),
                ),
            

                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                  GestureDetector(
                    onTap: (){
                      firstButtonPressed();
                    },
                    child: Image.asset(
                              'assets/images/tab0${selectedIndex == 0 ? '-1': ''}.png',
                              fit: BoxFit.contain,
                              height: 40,
                              width: 48,
                              // color: selectedIndex == 0 ?  MyColors.selectedItemColor : MyColors.unselectedItemColor,
                            ),
                  ),
                  GestureDetector(
                    onTap: (){
                      secondButtonPressed();
                    },
                    child: Image.asset(
                              'assets/images/tab1${selectedIndex == 1 ? '-1': ''}.png',
                              fit: BoxFit.contain,
                              height: 40,
                              width: 48,
                              // color: selectedIndex == 1 ?  MyColors.selectedItemColor : MyColors.unselectedItemColor,
                            ),
                  ),
                  GestureDetector(
                    onTap: (){
                      thirdButtonPressed();
                    },
                    child: Image.asset(
                              'assets/images/tab2${selectedIndex == 2 ? '-1': ''}.png',
                              fit: BoxFit.contain,
                              height: 40,
                              width: 48,
                              // color: selectedIndex == 2 ?  MyColors.selectedItemColor : MyColors.unselectedItemColor,
                            ),
                  ),
                  // GestureDetector(
                  //   onTap: (){
                  //     forthButtonPressed();
                  //   },
                  //   child: Image.asset(
                  //             'assets/images/tab3.png',
                  //             fit: BoxFit.contain,
                  //             height: 58,
                  //             width: 73,
                  //             color: selectedIndex == 3 ?  MyColors.selectedItemColor : MyColors.unselectedItemColor,
                  //           ),
                  // ),
                ],)
    ),
  ],
);



    // return Column(
    //   children: [
    //     // Container(height: 1, color: const Color(0xff999999),),
    //     Padding(
    //       padding: const EdgeInsets.fromLTRB(18, 0, 18, 60),
    //       child: ClipRRect(
    //         borderRadius: const BorderRadius.only(
    //           topLeft: Radius.circular(50.0),
    //           topRight: Radius.circular(50.0),
    //           bottomLeft: Radius.circular(50.0),
    //           bottomRight: Radius.circular(50.0),
    //         ),
        
    //         child: BottomNavigationBar(
    //           type : BottomNavigationBarType.fixed,
    //           backgroundColor: MyColors.bottomBarColor,
    //           selectedFontSize: 10,
    //           unselectedFontSize: 10,
    //           items: <BottomNavigationBarItem>[
    //             BottomNavigationBarItem(
    //               icon: Container(
    //                 color: const Color(0xffff0000),
    //                 height: 36,
    //                 child: const ImageIcon(
    //                   AssetImage("assets/images/icon0.png"),
    //                 ),
    //               ),
    //               label: 'Beaches Map',//selectedIndex == 0 ? 'Beaches Map' : '',
    //             ),
    //             const BottomNavigationBarItem(
    //               icon: SizedBox(
    //                 height: 36,
    //                 child: ImageIcon(
    //                   AssetImage("assets/images/icon1.png"),
    //                 ),
    //               ),
    //               label: 'Favourite', //selectedIndex == 1 ? 'Favourite' : '',
    //             ),
    //             const BottomNavigationBarItem(
    //               icon: SizedBox(
    //                 height: 36,
    //                 child: ImageIcon(
    //                   AssetImage("assets/images/icon2.png"),
    //                 ),
    //               ),
    //               label: 'Trip Planner',//selectedIndex == 2 ? 'Trip Planner' : '',
    //             ),
    //             const BottomNavigationBarItem(
    //               icon: SizedBox(
    //                 height: 36,
    //                 child: ImageIcon(
    //                   AssetImage("assets/images/icon3.png"),
    //                 ),
    //               ),
    //               label: 'Gallery',//selectedIndex == 3 ? 'Gallery' : '',
    //             ),
                
                
    //           ],
    //           currentIndex: selectedIndex,
    //           selectedItemColor: MyColors.selectedItemColor,
    //           unselectedItemColor: MyColors.unselectedItemColor,
    //           onTap: (int index) {
    //             if (index == 0) {
    //               firstButtonPressed();
    //             } else if (index == 1) {
    //               secondButtonPressed();
    //             } else if (index == 2) {
    //               thirdButtonPressed();
    //             } else {
    //               forthButtonPressed();
    //             }
                
    //           },
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  
  
  }
}
