import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../screens/home_screen.dart';
import '../screens/screen_1.dart';
import '../screens/screen_2.dart';
import '../screens/screen_3.dart';
import '../screens/screen_4.dart';

class MainScreenManager extends StatelessWidget {
  const MainScreenManager({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen(),
      const Screen1(),
      const Screen2(),
      const Screen3(),
      const Screen4(),
    ];
    final List<String> titles = [
      'Home',
      'Screen 1',
      'Screen 2',
      'Screen 3',
      'Screen 4',
      // TODO
    ];
    final List<BottomNavigationBarItem> bottomNavigationBarItems = [
      // Add your bottom navigation bar items here
    ];
    var currentIndex = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex.value]),
      ),
      body: IndexedStack(
        index: currentIndex.value,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationBarItems,
        currentIndex: currentIndex.value,
        onTap: (index) {
          currentIndex.value = index;
        },
      ),
    );
  }
}
