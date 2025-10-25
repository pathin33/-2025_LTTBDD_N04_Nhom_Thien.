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
  final _emailController = TextEditingController();
  //bien quan ly TextFieldForm
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Image.asset("assets/images/LogoFlashNote.png", height: 160),
                  const Text(
                    "Đăng nhập",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  ////khoang cach chiem 5% ti le man hinh
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Mật khẩu'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập mật khẩu';
                      }
                      if (!value.contains('@')) {
                        return 'không hợp lệ';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  //khoang cach chiem 2% ti le man hinh
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //neu from hop le thuc hien hanh dong tiep theo
                          final email = _emailController.text.trim();
                          //lay text nhap tu form bo khoang trang
                          if (email == "admin@gmail.com") {
                            //neu email = admin@gmail.com nhay sang man hinh dang nhap
                            //test cho chac nang da co tai khoan
                            context.go('/login');
                          } else {
                            //neu la email khac thi sang man hinh dang ki
                            //test cho chuc nang chua co tai khoan
                            context.go('/signup');
                          }
                        }
                      },
                      child: const Text("Tiếp theo"),
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
