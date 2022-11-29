/* import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:veterinaria_app/screens/home_screen.dart';

class PrincipalBnb extends StatelessWidget {
  const PrincipalBnb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);

    List<Widget> _buildScreens() {
      return [
        HomeScreen(),
        HomeScreen(),
        HomeScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: Colors.teal,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.add),
          title: ("Home"),
          activeColorPrimary: Colors.teal,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.person),
          title: ("Home"),
          activeColorPrimary: Colors.teal,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        duration: Duration(milliseconds: 1),
      ),
      navBarStyle:
          NavBarStyle.style13, // Choose the nav bar style with this property.
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:veterinaria_app/screens/home_screen.dart';

class PrincipalBnb extends StatefulWidget {
  @override
  createState() => _PrincipalBnbState();
}

class _PrincipalBnbState extends State<PrincipalBnb> {
  int _contador = 0;
  final _pages = [HomeScreen(), HomeScreen(), HomeScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _contador = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Agendar Cita'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        currentIndex: _contador,
        //Ocultar texto icono seleccionado
        showSelectedLabels: false,
        //Ocultar texto iconos no seleccionados
        showUnselectedLabels: false,
        selectedItemColor: Colors.teal,

        onTap: _onItemTapped,
      ),
      body: _pages[_contador],
    );
  }
}
