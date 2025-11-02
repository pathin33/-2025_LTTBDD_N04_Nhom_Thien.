import 'package:btl_moblie/widgets/onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controllerPage = PageController();
  //bien de quan ly cac page cua pageviews
  int _indexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controllerPage,
                //onePageChanged theo doi su thay doi cua cac trang
                onPageChanged: (index) {
                  setState(() {
                    _indexPage = index;
                  });
                },
                //neu so trang thay doi cap nhat cho bien indexPage
                children: [
                  OnboardingPage(
                    image: "assets/images/OnboardingPageImg1.png",
                    title: tr('onboarding.title1'),
                    description: tr('onboarding.desc1'),
                  ),
                  OnboardingPage(
                    image: "assets/images/OnboardingPageImg2.png",
                    title: tr('onboarding.title2'),
                    description: tr('onboarding.desc2'),
                  ),
                  OnboardingPage(
                    image: "assets/images/OnboardingPageImg3.png",
                    title: tr('onboarding.title3'),
                    description: tr('onboarding.desc3'),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //3 container de hien 3 dau cham tron
              children: List.generate(3, (index) {
                //moi container dai dien cho cac so index (0,1,2)
                return Container(
                  margin: const EdgeInsets.all(4),
                  //so sanh voi bien indexPage duoc cap nhat khi luot qua trang khac o pageview
                  //neu bang voi chi so index dai dien cua o cham do se 
                  //duoc thay doi kich thuoc va mau sac
                  width: _indexPage == index ? 12 : 8,
                  //neu indexPage = index thi chieu rong bang 12 ko thi bang 8
                  height: _indexPage == index ? 12 : 8,
                  //neu indexPage = index thi chieu cao bang 12 ko thi bang 8
                  decoration: BoxDecoration(
                    color: _indexPage == index ? Colors.blue : Colors.grey,
                    ////neu indexPage = index thi o tron co mau xanh ko thi bang mau xam
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.go('/loginorsignup');
                },
                child: Text(tr('button.getStarted')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
