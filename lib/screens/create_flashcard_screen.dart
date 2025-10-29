import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateFlashcardScreen extends StatefulWidget {
  const CreateFlashcardScreen({super.key});

  @override
  State<CreateFlashcardScreen> createState() => _CreateFlashcardScreenState();
}

class _CreateFlashcardScreenState extends State<CreateFlashcardScreen> {
  final _formKey = GlobalKey<FormState>();
  //bien khoa toan cuc cua form
  final _titleController = TextEditingController();
  //bien quan li form cua tieu de
  List<Widget> arrInputCard = [];
  //mang chu cac o nhap cho flashcard
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //nut quay lai man hinh truoc do
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            //nut tich
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                //neu cac dieu kien set cho o cac form dung hien ra thong bao tao thanh cong
                //de sau do gui len database gia lap vay
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    //cho snackbar noi len
                    padding: EdgeInsets.zero,
                    //xoa bo phan dem cua mac dinh cua snackbar
                    content: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.green, width: 4),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Padding(padding: const EdgeInsets.only(right: 12)),
                          Text("Bộ thi thẻ ghi nhớ đã được tạo thành công"),
                        ],
                      ),
                    ),
                    duration: Duration(seconds: 3),
                  ),
                );
              }
            },
            icon: Icon(CupertinoIcons.check_mark),
          ),
        ],
        //tieu de cua appbar
        title: Text("Tạo bộ thẻ ghi nhớ",style: TextStyle(fontSize: 20, color: CupertinoColors.label)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tiêu đề", style: TextStyle(fontSize: 16)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Chủ đề,chương,đơn vị...',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập tiêu đề';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Các thẻ ghi nhớ", style: TextStyle(fontSize: 16)),
                      Text("${arrInputCard.length}",style: TextStyle(fontSize: 16))
                      //hien thi so the ghi nho
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Column(
                    children: arrInputCard,
                  )
                  //hien thi cac o nhap cho flashcard lay tu mang
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: CupertinoButton(
        child: Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey3,
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(CupertinoIcons.add, color: Colors.white, size: 26),
        ),
        onPressed: () {
          setState(() {
            arrInputCard.add(buildFlashCard(context));
          });
          //khi nhan vao nut add them o nhap cho flashcard
        },
      ),
    );
  }
  //ham tra ve giao dien cho cac o nhap cua flashcard
  Container buildFlashCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(horizontal: 0,vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: CupertinoColors.separator.withOpacity(0.3),
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          TextFormField(decoration: InputDecoration(labelText: 'Thuật ngữ')),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          TextField(decoration: InputDecoration(labelText: 'Định nghĩa')),
        ],
      ),
    );
  }
}
