import 'package:btl_moblie/widgets/bottomnavigationbar_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AchievementScreen extends StatefulWidget {
  const AchievementScreen({super.key});

  @override
  State<AchievementScreen> createState() => _AchievementScreenState();
}

class _AchievementScreenState extends State<AchievementScreen> {
  final int currentAchievement = 3;
  //bien bieu thi cac thanh tuu da dat duoc
  final int allAchievement = 6;
  //bien bieu thi tong thanh tuu hien co
  final double progress = 0.5;
  //bien bieu thi tien trinh hoan thanh cac thanh tuu
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('achievement.appbar_title'),
          style: TextStyle(fontSize: 20, color: CupertinoColors.label),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            //o hien thi tien do hoan thanh tuu
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CupertinoColors.systemBackground,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.01),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
                border: Border.all(
                  color: CupertinoColors.separator.withOpacity(0.3),
                  width: 0.5,
                ),
              ),
              child: Column(
                children: [
                  Image.asset("assets/icons/medal.png", height: 70),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(tr('achievement.progress_title'), style: TextStyle(fontSize: 22)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text("${currentAchievement}/${allAchievement}"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  //thanh ngang hien thi tien trinh hoan thanh thanh tuu
                  Container(
                    height: 8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FractionallySizedBox(
                      //FractionallySizedBox dat kich thuoc theo cua no theo ti le phan tram cua widget cha
                      alignment: Alignment.centerLeft,
                      widthFactor: progress, // dat ti le phan tram kich thuoc
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue, Colors.lightBlueAccent],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text("${(progress * 100).round()}% ${tr('achievement.completed')}"),
                ],
              ),
            ),
            buildTitle(tr('achievement.unlocked_section')),
            achievementUnlocked(
              context: context,
              color: CupertinoColors.systemGreen,
              title: tr('achievement.novice_title'),
              sub: tr('achievement.novice_sub'),
              heightImage: 30,
              image: "assets/icons/rosette.png",
              dayUnlock: "3/3/2025"
            ),
            achievementUnlocked(
              context: context,
              color: CupertinoColors.systemYellow,
              title: tr('achievement.streak_title'),
              sub: tr('achievement.streak_sub'),
              heightImage: 30,
              image: "assets/icons/trophy.png",
              dayUnlock: "30/11/2025"
            ),
            achievementUnlocked(
              context: context,
              color: CupertinoColors.systemBlue,
              title: tr('achievement.diligent_title'),
              sub: tr('achievement.diligent_sub'),
              heightImage: 30,
              image: "assets/icons/book.png",
              dayUnlock: "30/12/2024"
            ),
            buildTitle(tr('achievement.locked_section')),
            achievementNotUnlocked(
              ratio: 0.3,
              context: context,
              color: CupertinoColors.systemYellow,
              title: tr('achievement.star_title'),
              sub: tr('achievement.star_sub'),
              heightImage: 30,
              image: "assets/icons/star.png",
            ),
            achievementNotUnlocked(
              ratio: 0.1,
              context: context,
              color: CupertinoColors.systemPink,
              title: tr('achievement.expert_title'),
              sub: tr('achievement.expert_sub'),
              heightImage: 30,
              image: "assets/icons/game.png",
            ),
            achievementNotUnlocked(
              ratio: 0.5,
              context: context,
              color: CupertinoColors.systemYellow,
              title: tr('achievement.speed_title'),
              sub: tr('achievement.speed_sub'),
              heightImage: 30,
              image: "assets/icons/flash.png",
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomnavigationbarWidget(),
    );
  }

  //tra ve o thanh tuu da duoc mo khoa
  Widget achievementUnlocked({
    required BuildContext context,
    required Color color,
    required String title,
    required String sub,
    required String image,
    required double heightImage,
    required String dayUnlock,
  }) {
    return GestureDetector(
      onTap: () {
        //khi nhan vao o thanh tuu se hien len man hinh hien chi tiet
        //ngay da dat dc thanh tuu
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) {
            return Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Image.asset(image, height: heightImage),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.label,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    sub,
                    style: TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.secondaryLabel,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color.withOpacity(0.1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.check_mark_circled, color: CupertinoColors.black),
                        Text("${tr('achievement.unlocked_on')} ${dayUnlock}", style: TextStyle(color: CupertinoColors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  ElevatedButton(
                    onPressed: () {
                      context.pop();
                      //khi nhan vao nut dong an man hinh hien len tro ve man hinh cu
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text(tr('achievement.close'))],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      //hien Icon thanh tuu va ten thanh tuu , yeu cau de dat dc thanh tuu
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: CupertinoColors.separator.withOpacity(0.3),
            width: 0.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(image, height: heightImage),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.label,
                    ),
                  ),
                  Text(
                    sub,
                    style: TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.secondaryLabel,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  //ham tra ve tieu de chua mo khoa
  Container buildTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: CupertinoColors.secondaryLabel)),
        ],
      ),
    );
  }
}

//tra ve cac thanh tuu chua mo khoa voi tien trinh kem theo
Widget achievementNotUnlocked({
  required BuildContext context,
  required Color color,
  required String title,
  required String sub,
  required String image,
  required double heightImage,
  required double ratio,
}) {
  return GestureDetector(
    onTap: () {
      //khi nhan vao o se hien ra man hinh tu duoi len hien chi tiet
      //hon ve thanh tuu do
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Image.asset(image, height: heightImage),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.label,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  sub,
                  style: TextStyle(
                    fontSize: 14,
                    color: CupertinoColors.secondaryLabel,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CupertinoColors.secondaryLabel,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.lock),
                      Text("${tr('achievement.progress')} ${(ratio * 100).round()}%")
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                ElevatedButton(
                  onPressed: () {
                    context.pop();
                    //khi nhan nut dong se dong man hinh hien len nay tro ve man hinh ban dau
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(tr('achievement.close'))],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
    ////hien Icon thanh tuu va ten thanh tuu , yeu cau de dat dc thanh tuu,tien do hoan thanh la bao nhieu bao phan tram
    child: Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: CupertinoColors.separator.withOpacity(0.3),
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(image, height: heightImage),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.label,
                  ),
                ),
                Text(
                  sub,
                  style: TextStyle(
                    fontSize: 14,
                    color: CupertinoColors.secondaryLabel,
                  ),
                ),
                Container(
                  height: 4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FractionallySizedBox(
                    //FractionallySizedBox dat kich thuoc theo cua no theo ti le phan tram cua widget cha
                    alignment: Alignment.centerLeft,
                    widthFactor: ratio, // dat ti le phan tram kich thuoc
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            color,
                            color.withOpacity(0.6),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    ),
  );
}