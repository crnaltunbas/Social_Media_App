import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../assets/colors.dart';
import '../main_controller.dart';
import '../presentation/pages/page_util.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context);

    return PersistentTabView(
      context,
      controller: mainController.bottomBarController,
      screens: AppPageType.values.map((page) => page.page).toList(),
      //AppPageTypea gore listeyi aliyorum
      items: AppPageType.values.map((page) {
        return PersistentBottomNavBarItem(
          icon: Icon(page.icon),
          title: page.title,
          activeColorPrimary: SocialMediaAppColors.thirdColor,
          inactiveColorPrimary: SocialMediaAppColors.greyDark,
        );
      }).toList(),
      padding: const EdgeInsets.all(6.0),
      confineToSafeArea: true,
      backgroundColor: SocialMediaAppColors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarHeight: kBottomNavigationBarHeight,
      //default navBarHeight
      decoration: const NavBarDecoration(
        border: Border(
          top: BorderSide(
            color: SocialMediaAppColors.greyDark,
          ),
        ),
        colorBehindNavBar: Colors.white,
      ),
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 300),
          curve: Curves.linearToEaseOut,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
        ),
      ),
      navBarStyle: NavBarStyle.style12,
    );
  }
}
