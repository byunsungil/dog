import 'package:capdog/home/widgets/adopt_widget.dart';
import 'package:capdog/home/widgets/home_widget.dart';
import 'package:capdog/home/widgets/voulunteer_widget.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _menuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen[100],
        appBar: AppBar(
        title: Text('AiDog'),
    centerTitle: true,
    actions: [
    IconButton(
    onPressed: () {},
    icon: const Icon(
    Icons.logout,
    ),
    ),
    if(_menuIndex == 0)
    IconButton(
    onPressed: () {},
    icon: const Icon(
    Icons.search,
    ),
    ),
    ],
    ),
    body: IndexedStack(
    index: _menuIndex,
    children: [
    HomeWidget(),
    VolunteerWidget(),
    AdoptWidget(),
    Container(
    color: Colors.grey,
    ),
    Container(
    color: Colors.yellow,
    ),
    Container(
    color: Colors.lightBlue,
    ),
    ],
    ),
    floatingActionButton: switch (_menuIndex) {
    0 => FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.person),
    ),
    1 => FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.person),
    ),
    2 => FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.person),
    ),
      // TODO: Handle this case.
      int() => throw UnimplementedError(),
    },
    bottomNavigationBar:
    NavigationBar(
    selectedIndex: _menuIndex,
    onDestinationSelected: (idx) {
    setState(() {
    _menuIndex = idx;
    });
    },
    destinations: const [
    NavigationDestination(icon: Icon(Icons.money), label: '기부'),
    NavigationDestination(icon: Icon(Icons.pets), label: '봉사'),
    NavigationDestination(icon: Icon(Icons.stroller), label: '입양'),
  ],
  ),
  );
}}
