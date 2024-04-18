import 'package:emergyai/components/barNavigation.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int index = 0;
  BarNavigation? myBNB;
  // This widget is the home page of your application. It is stateful, meaning
  @override
  void initState() {
    myBNB = BarNavigation(currentIndex: (i) {
      setState(() {
        index = i;
      });
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myBNB,
      body: Routes(index: index),
    );
  }
}


