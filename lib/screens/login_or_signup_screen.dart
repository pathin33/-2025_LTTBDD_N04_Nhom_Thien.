import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class LoginOrSignUpScreen extends StatefulWidget {
  const LoginOrSignUpScreen({super.key});

  @override
  State<LoginOrSignUpScreen> createState() => _LoginOrSignUpScreenState();
}

class _LoginOrSignUpScreenState extends State<LoginOrSignUpScreen> {
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
                  Image.asset("assets/images/Logo.png", height: 160),
                  const Text(
                    "Đăng kí hoặc đăng nhập",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  ////khoang cach chiem 5% ti le man hinh
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập email';
                      }
                      if (!value.contains('@')) {
                        return 'Email không hợp lệ';
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
                            context.push('/login');
                          } else {
                            //neu la email khac thi sang man hinh dang ki
                            //test cho chuc nang chua co tai khoan
                            context.push('/signup');
                          }
                          //xoa text o textfieldform sau khi nhan v button
                          setState(() {
                            _emailController.clear();
                          });
                        }
                      },
                      child: const Text("Tiếp theo"),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 0.8,
                          endIndent: 10,
                        ),
                      ),
                      const Text(
                        "hoặc",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 0.8,
                          indent: 10,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  //duoi day la chuc nang dang nhap nhanh bang facebook,apple,google
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {
                              //neu dang nhap bang google nhay sang trang home
                              context.go('/home');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/icons/google.png",height: 40,),
                                const SizedBox(width: 12),
                                const Text(
                                  "Đăng nhập với Google",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {
                              //neu dang nhap bang apple nhay sang trang home
                              context.go('/home');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(FontAwesomeIcons.apple, size: 23),
                                const SizedBox(width: 12),
                                const Text(
                                  "Đăng nhập với Apple",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {
                              //neu dang nhap bang facebook nhay sang trang home
                              context.go('/home');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/icons/facebook.png",height: 20,),
                                const SizedBox(width: 12),
                                const Text(
                                  "Đăng nhập với Facebook",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
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
        ),
      ),
    );
  }
}
