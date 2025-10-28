import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarhomeWidget extends StatelessWidget {
  const AppbarhomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //SliverAppBar giup toi uu linh hoat hon so voi appbar thong thuong 
      //ho tro nhieu hieu ung hoat anh
      floating: true,
      //lam cho appbar noi len khi luot len
      pinned: false,
      //ko dinh o dau man hinh (an appbar khi luot xuong)
      snap: true,
      //bat len luon khi luot len an ngay khi luot xuong
      title: const Text(
        "flashnote",
        style: TextStyle(fontSize: 20, color: CupertinoColors.label),
      ),
      backgroundColor: CupertinoColors.systemBackground.withOpacity(0.8),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(CupertinoIcons.search, size: 20,color: Colors.grey,),
        ),
        IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bell_fill, size: 20,color: Colors.grey,)),
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
