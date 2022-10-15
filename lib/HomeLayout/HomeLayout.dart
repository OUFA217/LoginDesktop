// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:login/LoginLayout/components.dart';
import 'package:sidebarx/sidebarx.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeLayout'),
      ),
      body: Row(
        children: [
          SidebarX(
            controller: SidebarXController(selectedIndex: 0, extended: true),
            items: bottomitems1,
            extendedTheme: const SidebarXTheme(
              width: 200,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            theme: SidebarXTheme(
              hoverColor: Colors.transparent,
              textStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
              selectedTextStyle: const TextStyle(color: Colors.black),
              itemTextPadding: const EdgeInsets.only(left: 30),
              selectedItemTextPadding: const EdgeInsets.only(left: 30),
              itemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              selectedItemDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.37),
                  ),
                  color: Colors.deepOrange),
            ),
          )
          // NavigationRail(
          //   indicatorColor: Colors.deepOrangeAccent,
          //   useIndicator: true,
          //   elevation: 10,
          //   unselectedIconTheme: IconThemeData(color: Colors.deepOrange),
          //   labelType: NavigationRailLabelType.all,
          //   unselectedLabelTextStyle: const TextStyle(color: Colors.black),
          //   backgroundColor: Colors.white,
          //   selectedIndex: currentindex,
          //   selectedIconTheme: IconThemeData(color: Colors.white),
          //   selectedLabelTextStyle: const TextStyle(color: Colors.black),
          //   onDestinationSelected: (index) {
          //     setState(() {
          //       changebottomnavindex(index);
          //     });
          //   },
          //   destinations: bottomitems,
          // ),
        ],
      ),
    );
  }
}
