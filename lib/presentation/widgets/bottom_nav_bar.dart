import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:tikino/core/routes/nav_bar_items.dart';
import 'package:tikino/core/routes/pages.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({
    super.key,
  });

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: AppPages.appScreens(),
      items: AppNavBarPages.navBarsItems(),

      // behaviors
      resizeToAvoidBottomInset: true,
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,

      // UI
      backgroundColor: Colors.grey.shade900,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      navBarHeight: MediaQuery.of(context).size.height * .08,
      confineToSafeArea: true,

      // Animations
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType:
              ScreenTransitionAnimationType.fadeIn,
        ),
      ),

      navBarStyle: NavBarStyle.style15,
    );
  }
}