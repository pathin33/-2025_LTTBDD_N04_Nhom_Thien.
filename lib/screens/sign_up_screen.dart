import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  //bien khoa toan cuc cua form
  final _passwordController = TextEditingController();
  //bien quan ly TextFieldForm cua mat khau
  final _nameController = TextEditingController();
  //bien quan ly TextFieldForm cua name
  final _confirmPasswordController = TextEditingController();
  //bien quan ly TextFieldForm cua xac nhan mk
  bool ishiddenps = true;
  //bien de tat bat hien mk cho password
  bool ishiddencps = true;
  //bien de tat bat hien mk cho confirm password
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      resizeToAvoidBottomInset:
          true, //dieu chinh chieu cao khi ban phim hien len

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/images/Logo.png", height: 160),
                  const Text(
                    "Tạo tài khoản",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  const Text(
                    "Hãy nhập thông tin để bắt đầu học tập",
                    style: TextStyle(fontSize: 18),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  //nhap ten
                  TextFormField(
                    controller: _nameController,
                    //an password
                    decoration: InputDecoration(labelText: 'Họ và tên'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập họ và tên';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  //nhap mat khau
                  TextFormField(
                    controller: _passwordController,
                    obscureText: ishiddenps,

                    //an password
                    decoration: InputDecoration(
                      labelText: 'Mật khẩu',
                      suffixIcon: IconButton(
                        icon: Icon(
                          ishiddenps ? Icons.visibility_off : Icons.visibility,
                          //
                        ),
                        onPressed: () {
                          setState(() {
                            ishiddenps = !ishiddenps;
                            //khi nhan vao icon chuyen bien ve dang nguoc lai
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập mật khẩu';
                      }
                      if (value.length < 8) {
                        return 'Mật khẩu phải lớn hơn hoặc bằng 8 kí tự';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  //nhap lai mat khau
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: ishiddencps,

                    //an password
                    decoration: InputDecoration(
                      labelText: 'Nhập lại mật khẩu',
                      suffixIcon: IconButton(
                        icon: Icon(
                          ishiddencps ? Icons.visibility_off : Icons.visibility,
                          //
                        ),
                        onPressed: () {
                          setState(() {
                            ishiddencps = !ishiddencps;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập mật khẩu';
                      }
                      final password  = _passwordController.text.trim();
                      if (!(value == password)) {
                        return 'Mật khẩu không trùng khớp';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  //khoang cach chiem 2% ti le man hinh

                  //nut dang ki
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //gia dinh neu cac dieu kien textfield dung se luu vao database 
                          //se chuyen ve trang chu cua ung dung
                          context.go('/home');
                          setState(() {
                            _passwordController.clear();
                            _confirmPasswordController.clear();
                            //xoa text o password va cofirmpassword
                          });
                        }
                      },
                      child: const Text("Đăng ký"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
