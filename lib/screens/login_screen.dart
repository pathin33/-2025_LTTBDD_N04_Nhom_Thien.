import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  //bien khoa toan cuc cua form
  final _passwordController = TextEditingController();
  //bien quan ly TextFieldForm cua mat khau
  final _otpController = TextEditingController();

  bool ishidden = true;
  //bien de tat bat hien mk

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
                    "Chào mừng trở lại!",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  ////khoang cach chiem 5% ti le man hinh
                  TextFormField(
                    controller: _passwordController,
                    obscureText: ishidden,
                    //an password
                    
                    decoration: InputDecoration(
                      labelText: 'Mật khẩu',
                      suffixIcon: IconButton(
                        icon: Icon(
                          ishidden ? Icons.visibility_off : Icons.visibility
                          //
                        ),
                        onPressed: (){
                          setState(() {
                            ishidden=!ishidden;
                          });
                        },
                      )
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

                  TextFormField(
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    //toi da so ki tu
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    //chi cho phep nhap ky tu so
                    style: TextStyle(
                      letterSpacing: 10,
                      fontWeight: FontWeight.w700,
                      fontSize: 16
                    ),

                    decoration: InputDecoration(
                      labelText: 'Mã OTP',
                      counterText: "",
                      //an bo dem so
                      
                    ),
                    onChanged: (value) {
                      if(value.length==6){
                        FocusScope.of(context).unfocus();
                        //an ban phim khi du co ki tu so
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập mã OTP';
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
                          final password = _passwordController.text.trim();
                          //lay gia tri tu o nhap password
                          final otp = _otpController.text.trim();
                          //lay gia tri tu o nhap otp
                          if(password=='123456'&&otp=='123'){
                            //gia lap password va otp nhu tren neu dung chuyen 
                            //sang man hinh trang chinh
                            context.go('/home');
                          }
                          else{
                            //neu mk ko dung se hien ra man hinh thong bao
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                //cho snackbar noi len
                                padding: EdgeInsets.zero,
                                //xoa bo phan dem cua mac dinh cua snackbar
                                content: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.red,
                                        width: 4,
                                      )
                                    )
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                                  child: Flex(
                                    direction: Axis.horizontal,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 12),

                                      ),
                                      Text("Vui lòng nhập lại mật khẩu hoặc mã otp không đúng !")
                                    ],
                                  ),
                                ),
                                duration: Duration(seconds: 3),
                              )
                            );
                          }
                        }
                      },
                      child: const Text("Đăng nhập"),
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