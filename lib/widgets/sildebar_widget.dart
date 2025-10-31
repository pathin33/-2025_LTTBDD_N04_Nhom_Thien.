import 'package:btl_moblie/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SildebarWidget extends StatefulWidget {
  const SildebarWidget({super.key});

  @override
  State<SildebarWidget> createState() => _SildebarWidgetState();
}

class _SildebarWidgetState extends State<SildebarWidget> {
  //ham show ra thong bao co muon dang xuat hay k
  void showLogoutDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text("Logout"),
        content: Text("Are you sure you want to logout?"),
        actions: [
          CupertinoDialogAction(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: Text("Logout"),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              // Perform logout
            },
          ),
        ],
      ),
    );
  }

  //ham, tao ra tieu de cac muc
  Widget buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: CupertinoColors.secondaryLabel,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  //ham xay dung len cac de muc kem ,tieu de,icon,mo ta,chuc nang keo theo
  Widget buildMenuItem({
    required IconData icon,
    //bieu tuong cua de muc
    required String title,
    //tieu de cua de muc
    required String subtitle,
    //mo ta cua de muc
    required Color color,
    //mau sac cua icon
    Widget? trailing,
    //widget nam cuoi cung cua de muc
    VoidCallback? onTap,
    //ham vao khi nguoi dung thao tac voi de muc
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        //ListTile widget nay de hien thi 1 dong cua danh sach gom co icon ,title ,trailing
        onTap: onTap,
        //xu li khi nguoi dung nhan vao danh muc
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        //dieu chinh le trong cua noi dung
        leading: Container(
          //icon ben trai cua danh muc
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 22),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: CupertinoColors.label,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 13, color: CupertinoColors.secondaryLabel),
        ),
        trailing:
            trailing ??
            Icon(
              CupertinoIcons.chevron_right,
              color: CupertinoColors.systemGrey2,
              size: 20,
            ),
        //neu ma ko truyen vao cho trailing se hien ra icon mui ten
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: CupertinoColors.systemGroupedBackground,
        child: SafeArea(
          child: Column(
            children: [
              // Container avatar voi thong tin user
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    // Avatar
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          User.avatarPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    // Tên user
                    Text(
                      User.name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.label,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    // Email
                    Text(
                      User.email,
                      style: TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.secondaryLabel,
                      ),
                    ),
                  ],
                ),
              ),

              // Cac danh muc
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  children: [
                    buildSectionTitle("TÀI KHOẢN"),
                    buildMenuItem(
                      icon: CupertinoIcons.person_circle,
                      title: "Hồ sơ",
                      subtitle: "Xem và chỉnh sửa hồ sơ",
                      color: Color(0xff2398C3),
                      onTap: () {
                        context.push('/editprofile');
                      },
                    ),
                    buildMenuItem(
                      icon: CupertinoIcons.star_fill,
                      title: "Thành tích",
                      subtitle: "Xem tiến độ của bạn",
                      color: CupertinoColors.systemYellow,
                      onTap: () {},
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    buildSectionTitle("TÙY CHỈNH"),
                    buildMenuItem(
                      icon: CupertinoIcons.settings,
                      title: "Cài đặt",
                      subtitle: "tùy chỉnh ứng dụng",
                      color: CupertinoColors.systemGrey,
                      onTap: () {},
                    ),
                    buildMenuItem(
                      icon: CupertinoIcons.moon_fill,
                      title: "Chế độ tối",
                      subtitle: "Chuyển đổi giao diện",
                      color: CupertinoColors.systemIndigo,
                      trailing: CupertinoSwitch(
                        //nut chuyen doi sang va toi
                        value: false,
                        onChanged: (value) {},
                      ),
                      onTap: null,
                    ),
                    buildMenuItem(
                      icon: CupertinoIcons.globe,
                      title: "Ngôn ngữ",
                      subtitle: "Chuyển đổi ngôn ngữ",
                      color: CupertinoColors.systemTeal,
                      onTap: () {
                        //man hinh ben duoi hien len de chuyen doi ngon ngu
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          backgroundColor:
                              CupertinoColors.systemGroupedBackground,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: CupertinoColors.systemGrey4,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    "Chọn ngôn ngữ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  //Nut chon tieng viet
                                  CupertinoButton(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    color: CupertinoColors.systemGrey5,
                                    borderRadius: BorderRadius.circular(12),
                                    onPressed: () {
                                      context.pop();
                                      //logic xu li o day
                                    },
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          CupertinoIcons.globe,
                                          color: CupertinoColors.activeBlue,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "Tiếng Việt",
                                          style: TextStyle(
                                            color: CupertinoColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  // nut chon ngon ngu tieng anh
                                  CupertinoButton(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    color: CupertinoColors.systemGrey5,
                                    borderRadius: BorderRadius.circular(12),
                                    onPressed: () {
                                      context.pop();
                                    },
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          CupertinoIcons.globe,
                                          color: CupertinoColors.activeBlue,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "English",
                                          style: TextStyle(
                                            color: CupertinoColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    buildSectionTitle("HỖ TRỢ"),
                    buildMenuItem(
                      icon: CupertinoIcons.question_circle_fill,
                      title: "Trợ giúp & Hỗ trợ",
                      subtitle: "Nhận trợ giúp",
                      color: CupertinoColors.systemGreen,
                      onTap: () {},
                    ),
                    buildMenuItem(
                      icon: CupertinoIcons.info_circle_fill,
                      title: "Giới thiệu",
                      subtitle: "Thông tin về tác giả",
                      color: CupertinoColors.systemBlue,
                      onTap: () {
                        context.push('/author');
                      },
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    // Nut bam dang xuat
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CupertinoColors.systemRed
                              .withOpacity(0.1),
                        ),
                        onPressed: () {
                          showLogoutDialog(context);
                          //khi nhan vao button goi ham show ra thong bao xem co dang xuat ko
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              "Đăng xuất",
                              style: TextStyle(
                                color: CupertinoColors.systemRed,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
