import 'package:easy_localization/easy_localization.dart';
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
                  Text(
                    tr('signup.title'),
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    tr('signup.subtitle'),
                    style: TextStyle(fontSize: 18),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  //nhap ten
                  TextFormField(
                    controller: _nameController,
                    //an password
                    decoration: InputDecoration(labelText: tr('signup.name_label')),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return tr('signup.name_empty');
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
                      labelText: tr('signup.password_label'),
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
                        return tr('signup.password_empty');
                      }
                      if (value.length < 8) {
                        return tr('signup.password_min_length');
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
                      labelText: tr('signup.confirm_password_label'),
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
                        return tr('signup.confirm_password_empty');
                      }
                      final password = _passwordController.text.trim();
                      if (!(value == password)) {
                        return tr('signup.password_mismatch');
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
                      child: Text(tr('signup.signup_button')),
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