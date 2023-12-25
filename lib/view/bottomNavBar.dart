
import 'package:flutter/material.dart';
import 'bottom_NavBar_Screens/cartScreen.dart';
import 'bottom_NavBar_Screens/categoryScreen.dart';
import 'bottom_NavBar_Screens/homeScreen.dart';
import 'bottom_NavBar_Screens/profileScreen.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  List<Widget> _screens = [
    HomeScreen(),
    CategoryScreen(),
    ProfileScreen()
  ];
  int _selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
        bottomNavigationBar:  BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              elevation: 4,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.black,
              unselectedItemColor:Colors.grey,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.grid_view),label: "Categories"),
                BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
              ],
              onTap: (value){
                setState(() {
                  _selectedIndex = value;
                });
              },
            ),);
  }
}