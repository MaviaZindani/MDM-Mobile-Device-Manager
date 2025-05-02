import 'package:appoint_it/controllers/auth_controller.dart';
import 'package:appoint_it/generic_widgets/drawer/widget/animated_drawer_item.dart';
import 'package:appoint_it/routing/app_navigator.dart';
import 'package:appoint_it/routing/app_route_names.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {

  final List<Map<String, dynamic>> menuItems = [
    {
      "icon": Icons.home,
      "title": "Home",
      "onTap": () {
        print('home');
        AppNavigation.goBack();
      }
    },
    {
      "icon": Icons.settings,
      "title": "Components",
      "onTap": () {
        AppNavigation.navigateTo(AppRoutesNames.mainScreen);
      }
    },
    {
      "icon": Icons.article,
      "title": "Articles",
      "onTap": () {
        AppNavigation.navigateTo(AppRoutesNames.mainScreen);
      }
    },
    {
      "icon": Icons.person,
      "title": "Profile",
      "onTap": () {
        AppNavigation.navigateTo(AppRoutesNames.mainScreen);
      }
    },
    {
      "icon": Icons.account_box,
      "title": "Account",
      "onTap": () {
        AppNavigation.navigateTo(AppRoutesNames.mainScreen);
      }
    },
    {
      "icon": Icons.settings,
      "title": "Settings",
      "onTap": () {
        AppNavigation.navigateTo(AppRoutesNames.mainScreen);
      }
    },
    {
      "icon": Icons.integration_instructions,
      "title": "Getting Started",
      "onTap": () {
        AppNavigation.navigateTo(AppRoutesNames.mainScreen);
      }
    },
    {
      "icon": Icons.logout,
      "title": "Log-Out",
      "onTap": () {
        AuthController authController = AuthController();
        authController.googleSignOut();
      }
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(251, 240, 98, 145),
        child: Stack(
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.wifi, color: Colors.white, size: 40),
                      SizedBox(height: 10),
                      Text("N",
                          style: TextStyle(fontSize: 40, color: Colors.white)),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      return AnimatedDrawerItem(
                        onTap: menuItems[index]["onTap"],
                        icon: menuItems[index]["icon"],
                        title: menuItems[index]["title"],
                        index: index,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
