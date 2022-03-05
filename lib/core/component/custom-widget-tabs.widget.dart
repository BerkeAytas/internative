import 'package:flutter/material.dart';
import 'package:internative/core/shared/costum_shared.dart';
import 'package:internative/main.dart';
import 'package:internative/view/favorites/favorites_view.dart';
import 'package:internative/view/homepage/homepage.dart';
import 'package:internative/view/profile/profile_view.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import 'screens.dart';

class CustomWidgetExample extends StatefulWidget {
  final BuildContext menuScreenContext;
  const CustomWidgetExample({Key? key, required this.menuScreenContext}) : super(key: key);

  @override
  _CustomWidgetExampleState createState() => _CustomWidgetExampleState();
}

class _CustomWidgetExampleState extends State<CustomWidgetExample> {
  PersistentTabController? _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      /* MainScreen(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),*/
      const Favorites(),
      const HomePage(),
      const Profile(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: null,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: null,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: null,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView.custom(
        context,
        controller: _controller,
        items: _navBarsItems(),
        screens: _buildScreens(),
        confineInSafeArea: true,
        itemCount: 3,
        handleAndroidBackButtonPress: true,
        stateManagement: true,
        hideNavigationBar: _hideNavBar,
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        customWidget: (navBarEssentials) => CustomNavBarWidget(
          items: _navBarsItems(),
          onItemSelected: (index) {
            setState(() {
              navBarEssentials.onItemSelected!(index); // THIS IS CRITICAL!! Don't miss it!
            });
          },
          selectedIndex: _controller!.index,
        ),
      ),
    );
  }
}
