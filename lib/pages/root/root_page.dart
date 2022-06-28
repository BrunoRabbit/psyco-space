import 'package:flutter/material.dart';
import 'package:psyco_space/pages/pacients/pacients_page.dart';
import 'package:psyco_space/pages/settings/settings_page.dart';
import 'package:psyco_space/theme/app_icons.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          PacientsPage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.black.withOpacity(
            0.15,
          ),
          items: const [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                IconData(
                  0xe667,
                  fontFamily: AppIconsReference.interface,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                IconData(
                  0xe72a,
                  fontFamily: AppIconsReference.socialPeople,
                ),
              ),
            ),
          ]),
    );
  }
}
