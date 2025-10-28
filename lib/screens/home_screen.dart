import 'package:btl_moblie/widgets/appbarhome_widget.dart';
import 'package:btl_moblie/widgets/bottomnavigationbar_widget.dart';
import 'package:btl_moblie/widgets/sildebar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SildebarWidget(),
      body: NestedScrollView(
        //vi SliverAppBar la 1 sliver cuon dac biet chi hoat trong trong NestedScrollView
        //len ta can NestedScrollView kem theo
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const AppbarhomeWidget(),
        ],
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Text("Box1"),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Text("Box2"),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Text("Box3"),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Text("Box4"),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Text("Box5"),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Text("Box6"),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomnavigationbarWidget(),
    );
  }
}
