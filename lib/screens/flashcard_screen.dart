import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class FlashcardScreen extends StatefulWidget {
  const FlashcardScreen({super.key});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  int currentIndex = 0;
  //bien de xac dinh xem vi cua the hien tai la bao nhieu
  bool flipped = false;
  //bien de xac ding xem la the do co duoc lat lai hay ko

  // Du lieu mau
  final List<Map<String, String>> flashcards = [
    {
      'front': 'World War I',
      'back': 'Chiến tranh thế giới thứ nhất (1914–1918)',
    },
    //du lieu test duoc bieu thi duoi dang key and value 1 list map
    //key front la the dang truoc ,key back la the dang sau
    {
      'front': 'World War II',
      'back': 'Chiến tranh thế giới thứ hai (1939–1945)',
    }, //moi map la 1 the (gom co dang trc va dang sau)
    {
      'front': 'Industrial Revolution',
      'back': 'Cách mạng công nghiệp (thế kỷ XVIII–XIX)',
    },
    {'front': 'French Revolution', 'back': 'Cách mạng Pháp (1789–1799)'},
    {'front': 'American Revolution', 'back': 'Cách mạng Mỹ (1775–1783)'},
    {'front': 'Cold War', 'back': 'Chiến tranh Lạnh (1947–1991)'},
    {'front': 'Renaissance', 'back': 'Thời kỳ Phục hưng (thế kỷ XIV–XVII)'},
    {
      'front': 'Discovery of America',
      'back': 'Christopher Columbus phát hiện châu Mỹ (1492)',
    },
    {
      'front': 'Fall of Constantinople',
      'back': 'Sự sụp đổ của Constantinople (1453)',
    },
    {'front': 'Russian Revolution', 'back': 'Cách mạng Nga (1917)'},
    {
      'front': 'Formation of the United Nations',
      'back': 'Thành lập Liên Hiệp Quốc (1945)',
    },
    {'front': 'Berlin Wall Fall', 'back': 'Bức tường Berlin sụp đổ (1989)'},
    {
      'front': 'Moon Landing',
      'back': 'Con người đặt chân lên Mặt Trăng (1969)',
    },
    {
      'front': 'Printing Press',
      'back': 'Phát minh máy in của Gutenberg (khoảng 1440)',
    },
    {'front': 'Magna Carta', 'back': 'Hiến chương Magna Carta (1215)'},
  ];

  void flipCard() {
    setState(() {
      flipped = !flipped;
    });
    //ham lat the
    //set state nguoc lai gia tri cho flipped tu true sang fasle va ngc lai tu fasle sang true
  }

  void nextCard() {
    if (currentIndex < flashcards.length - 1) {
      setState(() {
        currentIndex++;
        //sang vi tri the tiep theo
        flipped = false;
        //va ko cho the do lat
      });
    }
    //ham chuyen sang the tiep theo
    //vi cai vi tri cua the bat dau tu 0 nen ta p set dieu kien
    //la flashcards.length - 1 de cho currentIndex ko bang vi tri tai the cuoi cung
    // tai moi lan dieu kien thanh cong ta currentIndex++ thi vi tri cua no nhay sang the tiep theo r
    //neu ma cho currentIndex tai vi tri the cuoi cung no se qua so luong the
  }

  void previousCard() {
    if (currentIndex > 0) {
      //ko the bien vi tri currentIndex phai > 0 vi neu > = thi con gi the ma quay lai nua
      setState(() {
        currentIndex--;
        //thay doi bien vi tri de quay lai the
        flipped = false;
        //ko chop the do lat
      });
    }
    //ham quay lai the
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios, color: CupertinoColors.label),
        ),
        title: Text(
          '${currentIndex + 1} / ${flashcards.length}',
          style: TextStyle(
            color: CupertinoColors.label,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz, color: CupertinoColors.label),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // thanh bieu thi vi tri ma the do dang hien thi
            Container(
              height: 10,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: FractionallySizedBox(
                //FractionallySizedBox dat kich thuoc theo cua no theo ti le phan tram cua widget cha
                alignment: Alignment.centerLeft,
                widthFactor:
                    (currentIndex + 1) /
                    flashcards
                        .length, // so the hien da mo chia cho tong so the ra % hoan thanh
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.lightBlueAccent],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            // Cho hien thi the ghi nho
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: flipCard,
                  //neu nhan vao the dang hien thi lat the do
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    //animation hoat dong trong 3s
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        // FadeTransition widget thay doi su mo an cua widget con
                        opacity: animation,
                        child: child,
                      );
                      //tra ve kieu animation mo an dan
                    },
                    child: flipped
                        ? buildCard(
                            flashcards[currentIndex]['back']!,
                            //truyen vao 1 string tai vi tri cua the hien tai o dang la dang sau the
                            CupertinoColors.systemGrey2,
                            isBack: true,
                            key: ValueKey('back-$currentIndex'),
                          )
                        : buildCard(
                            flashcards[currentIndex]['front']!,
                            //truyen vao 1 string tai vi tri cua the hien tai o dang la dang truoc
                            CupertinoColors.activeBlue,
                            key: ValueKey('front-$currentIndex'),
                          ),
                    //de tao hieu ung nay ta can key de xac dinh xem
                    //2 widget co khac nhau ko de hieu ung xay ra
                  ),
                ),
              ),
            ),

            // Chi dan de va xac dinh dc mat trc va sau
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.hand_draw,
                    size: 20,
                    color: CupertinoColors.secondaryLabel,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    flipped ? 'Nhấn để xem mặt trước' : 'Nhấn để xem mặt sau',
                    //neu the da lat r thi hien ra 'Nhấn để xem mặt trước' neu ch lat thi hien ra 'Nhấn để xem mặt sau'
                    style: TextStyle(
                      color: CupertinoColors.secondaryLabel,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // hai button icon de chuyen den the khac
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //nut quay lai the
                  IconButton(
                    onPressed: currentIndex > 0 ? previousCard : null,
                    //neu vi tri the hien tai >0 thi cho quay lai ko thi banh null vo hieu hoa nut
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: currentIndex > 0
                          ? CupertinoColors.activeBlue
                          : CupertinoColors.systemGrey3,
                    ),
                    iconSize: 32,
                  ),
                  //nut chuyen den the tiep theo
                  IconButton(
                    onPressed: currentIndex < flashcards.length - 1
                        ? nextCard
                        : null,
                    //neu con the chuyen tiep thi chuyen ko thi nut bi vo hieu hoa
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: currentIndex < flashcards.length - 1
                          ? CupertinoColors.activeBlue
                          : CupertinoColors.systemGrey3,
                    ),
                    iconSize: 32,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //ham tra ve giao dien cua
  Widget buildCard(String text, Color color, {bool isBack = false, Key? key}) {
    return Container(
      key: key,
      width: double.infinity,
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(color: color.withOpacity(0.3), width: 2),
      ),
      child:
          // Noi dung hien thi
          Center(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isBack
                        ? CupertinoIcons.textformat_abc
                        : CupertinoIcons.book_fill,
                    size: 48,
                    color: color.withOpacity(0.5),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.label,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      isBack ? 'Định nghĩa' : 'Thuật ngữ',
                      style: TextStyle(
                        color: color,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
