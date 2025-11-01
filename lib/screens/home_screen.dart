import 'package:btl_moblie/widgets/appbarhome_widget.dart';
import 'package:btl_moblie/widgets/bottomnavigationbar_widget.dart';
import 'package:btl_moblie/widgets/sildebar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SildebarWidget(),
      body: NestedScrollView(
        //vi SliverAppBar la 1 sliver cuon dac biet chi hoat trong trong NestedScrollView
        //len ta can NestedScrollView kem theo
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const AppbarhomeWidget(),
        ],
        body: ListView(
          children: [
            //Text chao mung quay lai
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Chào mừng đã trở lại!",
                    style: TextStyle(
                      color: CupertinoColors.label,
                      fontSize: 25,
                    ),
                  ),
                  const Text(
                    "Tiếp tục hành trình học tập của bạn",
                    style: TextStyle(
                      color: CupertinoColors.secondaryLabel,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            //O thong ke so the ghi nho va chuoi ngay lien tuc
            Row(
              children: [
                Expanded(
                  child: buildCardStatistics(
                    icon: CupertinoIcons.doc_text,
                    number: "24",
                    sub: "Thẻ ghi nhớ",
                    bgColor: CupertinoColors.systemBlue.withOpacity(0.1),
                  ),
                ),
                Expanded(
                  child: buildCardStatistics(
                    icon: CupertinoIcons.flame,
                    number: "7",
                    sub: "Chuỗi ngày liên tiếp",
                    bgColor: CupertinoColors.systemOrange.withOpacity(0.1),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: const Text(
                "Bộ thẻ ghi nhớ gần đây",
                style: TextStyle(color: CupertinoColors.label, fontSize: 25),
              ),
            ),
            //cac bo the 
            buildDecks(
              context: context,
              title: "Ngữ Pháp Tiếng Anh",
              numberCards: 5,
              color: CupertinoColors.systemGreen,
              progress: 100, // Tiến độ 1
            ),
            buildDecks(
              context: context,
              title: "Từ Vựng Toeic",
              numberCards: 50,
              color: CupertinoColors.systemRed,
              progress: 10,
            ),
            buildDecks(
              context: context,
              title: "Lịch Sử Thế Giới",
              numberCards: 8,
              color: CupertinoColors.systemOrange,
              progress: 50,
            ),
            buildDecks(
              context: context,
              title: "Hóa Học Hữu Cơ",
              numberCards: 120,
              color: CupertinoColors.systemPurple,
              progress: 99, // Tiến độ 4
            ),
            buildDecks(
              context: context,
              title: "Các Thủ Đô Châu Á",
              numberCards: 30,
              color: CupertinoColors.systemTeal,
              progress: 22,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomnavigationbarWidget(),
    );
  }
  //ham tra ve 1 container hien thi ten bo suu tap, so the ghi nho, tien do hoan thanh
  Widget buildDecks({
    required BuildContext context,
    required String title,
    required int numberCards,
    required int progress,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () {
        context.push('/flashcard');
      },
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
              child: Icon(
                CupertinoIcons.square_stack_3d_up_fill,
                color: color,
                size: 24,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.label,
                    ),
                  ),
                  Text(
                    "${numberCards} thẻ",
                    style: TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.secondaryLabel,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "${progress}%",
                style: TextStyle(color: color, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
  //ham tra ve 1 container de thong ke(so the ghi nho,chuoi ngay dang nhap)
  Container buildCardStatistics({
    required String number,
    required String sub,
    required IconData icon,
    required Color bgColor,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 35),
          Text(
            number,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
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
    );
  }
}
