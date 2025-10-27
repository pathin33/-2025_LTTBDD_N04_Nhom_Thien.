import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarhomeWidget extends StatelessWidget implements PreferredSizeWidget {
  //khi muon dung appbar mk lam flutter yeu cau minh cho no chieu cao cu the cua appbar do
  //the nen ta phai implements PreferredSizeWidget
  const AppbarhomeWidget({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);//kToolbarHeight hang so mac dinh cua flutter tuong ung voi 56px
  //tinh toan kich thuoc cua appbar
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "flashnote",
        style: TextStyle(fontSize: 20, color: CupertinoColors.label),
      ),
      backgroundColor: CupertinoColors.systemBackground.withOpacity(0.8),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(CupertinoIcons.search, size: 20),
        ),
        IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bell, size: 20)),
      ],
      leading: Builder(
        builder: (context) => GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Container(
            margin: EdgeInsets.all(5),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey5,
              borderRadius: BorderRadiusDirectional.circular(35),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image.asset(
                "assets/images/avatar.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
