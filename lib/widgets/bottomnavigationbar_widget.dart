import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomnavigationbarWidget extends StatefulWidget {
  const BottomnavigationbarWidget({super.key});

  @override
  State<BottomnavigationbarWidget> createState() =>
      _BottomnavigationbarWidgetState();
}

class _BottomnavigationbarWidgetState extends State<BottomnavigationbarWidget> {
  int _selectedIndex = 0;
  //bien de luu so man hinh dang chon

  Widget _buildIconWithBackground(IconData icon, int index) {
    //ham de xu li khi nhan vao icon tren bottomnavigationbar
    //no se thay doi icon sang dang fill
    //va hien nen mau xung quang icon
    bool isSelected = _selectedIndex == index;
    //bien isSelected tra ve fasle neu selectedIndex  ko bang index neu bang thi la true
    return AnimatedContainer(
      //widget nay di container thong thuong vay nhung them 1 so hieu ung chuyen dong
      //khi cac thuoc tinh thay doi
      duration: Duration(milliseconds: 200),

      curve: Curves.easeInOut,
      //tao ra hieu ung chuyen dong sau 2 s
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected
            ? Color(0xff2398C3).withOpacity(0.12)
            : Colors.transparent,
        //isSelected la true se co mau xanh bao quanh ko thi mau nhu mau nen
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, size: 26),
    );
  }

  @override
  Widget build(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);
    //lay trang thai cua gorouter tu buildcontext
    //tu do bien state se la 1 doi tuong chua thong tin cua router
    final String location = state.matchedLocation;
    //lay duong dan url tu doi tuong state
    if (location.startsWith('/home')) {
      //so sanh url co '/home' co trung ko de set gia tri cho bien _selectedIndex 
      //de khi nhan icon o bottom no se dc higlight
      //dua vao url de higlight icon tai bottom
      _selectedIndex = 0;
    } else if (location.startsWith('/create')) {
      _selectedIndex = 1;
    } else if (location.startsWith('/achievement')) {
      _selectedIndex = 2;
    }
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xff2398C3),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          //khi nhan vao cac icon o bottomnavigationbar dua vao chi so index dich chuyen
          // den man hinh app tuong ung
          switch (index) {
            case 0:
              context.go('/home');
              break;
            case 1:
              context.push('/create');
              break;
            case 2:
              context.go('/achievement');
              break;
          }
        },
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedFontSize: 12,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, height: 1.5),
        items: [
          BottomNavigationBarItem(
            label: tr('bottom_nav.home'),
            icon: _buildIconWithBackground(Icons.home, 0),
            activeIcon: _buildIconWithBackground(Icons.home, 0),
          ),
          BottomNavigationBarItem(
            label: tr('bottom_nav.create'),
            icon: _buildIconWithBackground(CupertinoIcons.add, 1),
            activeIcon: _buildIconWithBackground(CupertinoIcons.add, 1),
          ),
          BottomNavigationBarItem(
            label: tr('bottom_nav.achievement'),
            icon: _buildIconWithBackground(CupertinoIcons.star_fill, 2),
            activeIcon: _buildIconWithBackground(CupertinoIcons.star_fill, 2),
          ),
        ],
      ),
    );
  }
}