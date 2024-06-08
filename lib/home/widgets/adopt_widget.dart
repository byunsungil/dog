import 'package:flutter/material.dart';

class AdoptWidget extends StatefulWidget {
  const AdoptWidget({super.key});

  @override
  State<AdoptWidget> createState() => _AdoptWidgetState();
}

class _AdoptWidgetState extends State<AdoptWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
          children: [
          SearchBar(),
          SizedBox(
            height: 16,
          ),
          ButtonBar(
            children: [
              ElevatedButton(onPressed: () {}, child: Text("입양 등록"),
              ),
            ],
          ),
          Text('입양 목록',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            ),
            Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        height: 120,
                        margin: EdgeInsets.only(bottom: 16),
                        color: Colors.orange,
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(8)
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('이 름',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15
                                          ),
                                        ),
                                        PopupMenuButton(
                                            itemBuilder: (context) => [
                                              PopupMenuItem(child: Text('신청'),
                                              ),
                                            PopupMenuItem(child: Text('취소'),
                                            ),
                                            ],
                                        ),
                                      ],
                                    ),
                                    Text('정보'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }))
    ],
      ));

  }
}
