import 'package:flutter/material.dart';
import 'package:internative/core/component/custom-widget-tabs.widget.dart';
import 'package:internative/core/shared/costum_shared.dart';
import 'package:internative/view/authenticate/login.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

void main() {
  runApp(const MyApp());
}

BuildContext? testContext;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: costumThemeData,
      home: const Login(),
    );
  }
}

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sample Project"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: ElevatedButton(
              child: const Text("Custom widget example"),
              onPressed: () => pushNewScreen(
                context,
                screen: CustomWidgetExample(
                  menuScreenContext: context,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------------------------------- Custom Style ----------------------------------------- //

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  const CustomNavBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
  });

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      height: kBottomNavigationBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                  size: 26.0,
                  color: isSelected
                      ? (item.activeColorSecondary == null ? item.activeColorPrimary : item.activeColorSecondary)
                      : item.inactiveColorPrimary == null
                          ? item.activeColorPrimary
                          : item.inactiveColorPrimary),
              child: isSelected ? item.icon : item.inactiveIcon ?? item.icon,
            ),
          ),
          /*Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                  child: Text(
                item.title,
                style: TextStyle(
                    color: isSelected
                        ? (item.activeColorSecondary == null ? item.activeColorPrimary : item.activeColorSecondary)
                        : item.inactiveColorPrimary,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
              )),
            ),
          )*/
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SizedBox(
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            int index = items.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  this.onItemSelected(index);
                },
                child: _buildItem(item, selectedIndex == index),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
