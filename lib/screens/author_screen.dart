import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthorScreen extends StatelessWidget {
  const AuthorScreen({super.key});
  Widget buildTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: CupertinoColors.secondaryLabel,
          letterSpacing: 0.5,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget buildContactInfo({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 22, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.label,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: CupertinoColors.secondaryLabel,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "Giới thiệu",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.label,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Xin chào! Mình Bá Thiện thành viên nhóm LTTBDD_N04_Nhom_Thien thuộc học phần lập trình thiết bị di động lớp N04 . Ứng dụng FlashNote này do mình phát triển với mong muốn mang lại nhiều công cụ học tập hiệu quả hữu ích, giúp cho người dùng ghi nhớ kiến thức nhanh và dễ dàng hơn.",
                ),
              ],
            ),
          ),
          buildTitle("Thông tin nhóm"),
          buildContactInfo(
            icon: CupertinoIcons.collections_solid,
            title: "Tên nhóm",
            subtitle: "2025_LTTBDD_N04_Nhom_Thien",
            color: Color(0xff2398C3),
          ),
          buildContactInfo(
            icon: CupertinoIcons.group,
            title: "Thành viên",
            subtitle: "Nguyễn Bá Thiện - 23010704",
            color: Color(0xff2398C3),
          ),
          buildTitle("Thông tin liên hệ"),
          buildContactInfo(
            icon: CupertinoIcons.globe,
            title: "Github",
            subtitle: "pathin33",
            color: Color(0xff2398C3),
          ),
          buildContactInfo(
            icon: CupertinoIcons.mail,
            title: "Email",
            subtitle: "bathien2k5@gmail.com",
            color: Color(0xff2398C3),
          ),
        ],
      ),
    );
  }
}
