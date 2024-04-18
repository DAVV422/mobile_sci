import 'package:emergyai/views/form/form_home.dart';
import 'package:emergyai/views/home/inicio.dart';
import 'package:emergyai/views/notification/notification_home.dart';
import 'package:emergyai/views/user/user_profile.dart';
import 'package:flutter/material.dart';

class BarNavigation extends StatefulWidget {
  final Function currentIndex;
  const BarNavigation({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<BarNavigation> createState() => _BarNavigationState();
}

class _BarNavigationState extends State<BarNavigation> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: index,
        onTap: (int i) {
          setState(() {
            index = i;
            widget.currentIndex(i);
          });
        },
        selectedItemColor: const Color.fromRGBO(255, 143, 0, 1),
        unselectedItemColor: Colors.grey,
        iconSize: 25.0,
        selectedFontSize: 12.0,
        unselectedFontSize: 10.0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Formularios',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Notificaciones',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Perfil',
            backgroundColor: Colors.white,
          ),
        ]);
  }
}



class Routes extends StatelessWidget {
  final int index;
  const Routes({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      InicioScreen(),
      FormHomeScreen(),
      NotificationHomeScreen(),
      UserProfileScreen(),
    ];
    return myList[index];
  }
}