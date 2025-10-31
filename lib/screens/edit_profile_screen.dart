import 'package:btl_moblie/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _NameController = TextEditingController();
  final _PasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView(
        children: [
          //hien giao dien anh user va name
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    User.avatarPath,
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  User.name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.label,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Form(
            key: _formKey,
            child: Column(
              children: [
                buildTitle(title: "Tên đăng nhập"),
                //o nhap ten dang nhap
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                  child: TextFormField(
                    controller: _NameController,
                    decoration: InputDecoration(
                      hintText: User.name,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập tên thay đổi';
                      }
                      return null;
                    },
                  ),
                ),
                buildTitle(title: "Email"),
                //o hien email
                GestureDetector(
                  onTap: () {
                    //neu nhan vao o email hien ra thong bao
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: const Text("Không thể thay đổi email"),
                        content: const Text(
                          "Email được dùng để đăng nhập và xác thực tài khoản, nên không thể thay đổi.",
                        ),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text("OK"),
                            onPressed: () => context.pop(),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: User.email,
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      enabled: false,
                    ),
                  ),
                ),
                buildTitle(title: "Thay đổi mật khẩu"),
                //o nhap mat khau cu
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                  child: TextFormField(
                    controller: _PasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Nhập mật khẩu hiện tại",
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập mật khẩu hiện tại';
                      }
                      return null;
                    },
                  ),
                ),
                //o nhap mat khau moi
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                  child: TextFormField(
                    controller: _newPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Nhập mật khẩu mới",
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập mật khẩu mới';
                      }
                      return null;
                    },
                  ),
                ),
                //o nhap lai mat khau
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Nhập lại mật khẩu mới",
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập lại mật khẩu';
                      }
                      if (value != _newPasswordController.text) {
                        return 'Mật khẩu không khớp';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      //neu cac dieu kien tai form dung yeu cau
                      if (_formKey.currentState!.validate()) {
                        //hien ra man hinh thong bao
                        showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: const Text("Hồ sơ đã được cập nhật"),
                            // content: const Text(
                            //   "Email được dùng để đăng nhập và xác thực tài khoản, nên không thể thay đổi.",
                            // ),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text("OK"),
                                onPressed: () => context.pop(),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text("Lưu thay đổi"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  //ham tra ve giao dien cua title co o nhap
  Container buildTitle({required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: CupertinoColors.secondaryLabel)),
        ],
      ),
    );
  }
}
