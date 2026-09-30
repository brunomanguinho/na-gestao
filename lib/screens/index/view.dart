import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _selectedTab = 0;

  static const tabs = [
    NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Início'),
    // NavigationDestination(
    //   icon: Icon(Icons.task_alt_outlined),
    //   label: 'Aprovações',
    // ),
    // NavigationDestination(icon: Icon(Icons.apartment_outlined), label: 'Obras'),
    NavigationDestination(icon: Icon(Icons.person_outline), label: 'Perfil'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text("Index Area")),
      bottomNavigationBar: NavigationBar(
        destinations: tabs,
        selectedIndex: _selectedTab,
        onDestinationSelected: (index) {
          setState(() => _selectedTab = index);
        },
      ),
    );
  }
}
