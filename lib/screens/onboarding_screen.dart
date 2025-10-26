import 'package:btl_moblie/widgets/onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                children: const [
                  OnboardingPage(
                    image: "assets/images/OnboardingPageImg1.png",
                    title: "Học tập dễ dàng",
                    description: "Biến việc ghi nhớ thành trò chơi thú vị với FlashNote. Ôn tập nhanh, hiệu quả và không còn cảm giác nhàm chán khi học nữa!",
                  ),
                  OnboardingPage(
                    image: "assets/images/OnboardingPageImg2.png",
                    title: "Tạo Flashcard riêng",
                    description: "Tự do thiết kế thẻ ghi nhớ theo phong cách của bạn. Thêm nội dung, hình ảnh hoặc ví dụ để việc học trở nên sinh động và gần gũi hơn.",
                  ),
                  OnboardingPage(
                    image: "assets/images/OnboardingPageImg3.png",
                    title: "Theo dõi tiến trình học",
                    description: "Xem lại lịch sử học tập, đánh dấu thẻ đã thuộc và theo dõi mức độ tiến bộ của bạn mỗi ngày để luôn có động lực học tiếp!",
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
                child: Text("Bắt đầu ngay"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
