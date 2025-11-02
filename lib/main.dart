import 'package:btl_moblie/routes/app_routes.dart';
// import 'package:btl_moblie/screens/splash_screen.dart';
import 'package:btl_moblie/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  //dam bao dc khoi tao cung vs app
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('vi'),//tieng viet
        Locale('en')//tieng anh
       ],
      path: 'assets/lang',
      child: MyWidget(),
    ),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      //dung ngon ngu ma ng dung da chon

      supportedLocales: context.supportedLocales,
      //chi ho tro tieng viet va tieng anh
      routerConfig: appRouter,
    );
  }
}
