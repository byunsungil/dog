import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  PageController pageController = PageController();
  int bannerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
          height: 140,
            color: Colors.indigo,
            margin: EdgeInsets.only(bottom: 8),
            child: PageView(
              controller: pageController,
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(8),
                  child: Image.asset('assets/exdog.jpeg'),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(8),
                  child: Image.asset('assets/exdog.jpeg'),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(8),
                  child: Image.asset('assets/exdog.jpeg'),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(8),
                  child: Image.asset('assets/exdog.jpeg'),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(8),
                  child: Image.asset('assets/exdog.jpeg'),
                ),
              ],
              onPageChanged: (idx) {
                setState(() {
                  bannerIndex = idx;
                });
              },
            ),
      ),
      DotsIndicator(
        dotsCount: 5,
        position: bannerIndex,
      ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.symmetric(vertical:16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('카테고리',style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 16,),),
                    TextButton(onPressed: () {}, child: Text('더보기'),
                    ),
                  ],
                ),
                // Todo: 카테고리 목록 받아오는 위젯
                Container(
                  height: 250,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 12),
            padding: EdgeInsets.only(left: 16,top: 8,bottom: 16),
            color: Colors.white,
            child: Column(
              children: [
                ButtonBar(
                  children: [
                    ElevatedButton(onPressed: () {
                      if(context.mounted) {
                        context.go('/pay');
                      }
                    }, child: Text('후원하기'),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('도움의 손길',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    ),
                    TextButton(onPressed: () {},
                        child: Text('더보기'),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 12, right: 12),
                  height: 240,
                  color: Colors.greenAccent,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
