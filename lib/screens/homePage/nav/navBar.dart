import 'package:flutter/material.dart';
import 'package:school_app/screens/homePage/student/home_page.dart';
import 'package:school_app/shared/theme.dart';

class NavBarBottom extends StatefulWidget {
  const NavBarBottom({super.key});

  @override
  State<NavBarBottom> createState() => _NavBarBottomState();
}

class _NavBarBottomState extends State<NavBarBottom> {
  int currentIndex = 0;

  @override
  bool _clicked = false;

  void _toggleRotation() {
    setState(() {
      _clicked = !_clicked;
    });
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return HomePage();
      case 2:
        return HomePage();
      case 3:
        return HomePage();
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(
            color: AppColors.black60,
            width: 1.0,
          ),
        )),
        child: BottomAppBar(
          padding: const EdgeInsets.all(0),
          shape: const CircularNotchedRectangle(),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.white,
            elevation: 0,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_presensi.png',
                  width: 24,
                  color: AppColors.darkBlue,
                ),
                activeIcon: Image.asset(
                  'assets/icon_presensi.png',
                  width: 24,
                ),
                label: 'Presensi',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_edumart.png',
                  width: 24,
                  color: AppColors.darkBlue,
                ),
                activeIcon: Image.asset(
                  'assets/icon_edumart.png',
                  width: 24,
                  color: AppColors.primary1,
                ),
                label: 'EduMart',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_edupay.png',
                  width: 24,
                  color: AppColors.darkBlue,
                ),
                activeIcon: Image.asset(
                  'assets/icon_edupay.png',
                  width: 24,
                  color: AppColors.primary1,
                ),
                label: 'EduPay',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_user.png',
                  width: 24,
                  color: AppColors.darkBlue,
                ),
                activeIcon: Image.asset(
                  'assets/icon_user.png',
                  width: 24,
                  color: AppColors.primary1,
                ),
                label: 'Profil',
              ),
            ],
          ),
        ),
      ),
      body: body(),
    );
  }
}
