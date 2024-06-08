import 'package:capdog/model/cate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addCategories(String title)async{
  final db = FirebaseFirestore.instance;
  final ref = db.collection('category');
  await ref.add({'title':title});
}

Future<List<Cate>> fetchCate()async{
  final db = FirebaseFirestore.instance;
  final resp = await db.collection('cate').orderBy('timestamp').get();
  List<Cate> items = [];
  for(var doc in resp.docs){
    final item = Cate.fromJson(doc.data());
    final realItem = item.copyWith(docId: doc.id);
    items.add(item);
  }
  return items;
}

Stream<QuerySnapshot> streamCate(String query) {
  final db = FirebaseFirestore.instance;
  if(query.isNotEmpty){
    return db.collection('cate').orderBy('title')
        .startAt([query]).endAt([query + '\uffff']).snapshots();
  }
  return db.collection('cate').orderBy('timestamp').snapshots();
}

class VolunteerWidget extends StatefulWidget {
  const VolunteerWidget({super.key});

  @override
  State<VolunteerWidget> createState() => _VolunteerWidgetState();
}

class _VolunteerWidgetState extends State<VolunteerWidget> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SearchBar(
            controller: textEditingController,
            leading: const Icon(Icons.search),
            onChanged: (s) {
              setState(() {

              });
            },
        hintText: '검색',
      ),

          const SizedBox(
            height: 16,
          ),
          ButtonBar(
            children: [
              ElevatedButton(onPressed: () {
                if(context.mounted) {
                  context.go('/volunteer/add');
                }
              },
                child: const Text("봉사활동 등록"),
              ),
              ElevatedButton(onPressed: () {
                if(context.mounted) {
                  context.go('/volunteer/detail');
                }
              },
                child: const Text('신청현황'),
              ),
            ],
          ),

          const Text('봉사활동 목록',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: streamCate(textEditingController.text),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  final items = snapshot.data?.docs.map((e) =>
                  Cate.fromJson(e.data() as Map<String, dynamic>).copyWith(
                    docId: e.id,
                  ))
                  .toList();
                  return ListView.builder(
                    itemCount: items?.length,
                      itemBuilder: (context, index) {
                        final item = items?[index];
                        return GestureDetector(
                          onTap: () {
                            print(item?.docId);
                          },
                          child: Container(
                            height: 180,
                            margin: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Image.asset('assets/aid.jpeg'),
                                ),
                                Expanded(child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                           Text(
                                             item?.title ?? '봉사활동 ?? ',
                                             style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                          ),
                                          PopupMenuButton(
                                            itemBuilder: (context) =>
                                            [
                                              PopupMenuItem(
                                                child: const Text('신청'),
                                                onTap: () async {
                                                  User? user = FirebaseAuth
                                                      .instance.currentUser;
                                                    if (user != null) {
                                                      DocumentSnapshot docSnapshot = await FirebaseFirestore
                                                      .instance
                                                      .collection('cate')
                                                      .doc(item?.docId).get();
                                                      Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;
                                                      List<dynamic> applicants = data?['applicants'] ?? [];

                                                      bool isAlreadyApplied = applicants.any((applicant) => applicant['uid'] == user.uid);

                                                      if (isAlreadyApplied) {
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                            const SnackBar(
                                                              content: Text("이미 신청하였습니다"),
                                                            ),
                                                        );
                                                      } else {
                                                        await FirebaseFirestore.instance
                                                            .collection('cate')
                                                            .doc(item?.docId)
                                                            .update({
                                                          'applicants' : FieldValue.arrayUnion([
                                                            {
                                                              'uid': user.uid,
                                                              'email': user.email,
                                                            }
                                                          ])
                                                        });
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                          const SnackBar(
                                                            content: Text('신청이 완료되었습니다'),
                                                          ),
                                                        );
                                                      }
                                                    }

                                                  },
                                              ),
                                              PopupMenuItem(
                                                child: const Text('취소'),
                                                onTap: () async {
                                                  User? user = FirebaseAuth.instance.currentUser;
                                                  if (user != null) {
                                                    DocumentSnapshot docSnapshot = await FirebaseFirestore
                                                        .instance
                                                        .collection('cate')
                                                        .doc(item?.docId)
                                                        .get();

                                                    Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;
                                                    List<dynamic> applicants = data?['applicants'] ?? [];

                                                    bool isAreadyApplied = applicants.any(
                                                        (applicant) => applicant['uid'] == user.uid);
                                                    if (isAreadyApplied) {
                                                      await FirebaseFirestore.instance
                                                          .collection('cate')
                                                          .doc(item?.docId)
                                                          .update({
                                                        'applicants' : FieldValue.arrayRemove([
                                                          {
                                                            'uid' : user.uid,
                                                            'email' : user.email,
                                                          }
                                                        ])
                                                      });
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        const SnackBar(
                                                          content: Text('신청이 취소되었습니다'),
                                                        ),
                                                      );
                                                    } else {
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        const SnackBar(
                                                            content: Text('신청 내역이 없습니다'),
                                                        ),
                                                      );
                                                    }
                                                  }
                                                },
                                              ),
                                              PopupMenuItem(
                                                child: const Text('삭제'),
                                                onTap: () async {
                                                  final db = FirebaseFirestore.instance;
                                                  await FirebaseFirestore
                                                        .instance
                                                        .collection('cate')
                                                        .doc(item?.docId)
                                                        .delete();
                                                }



                                              )],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 2.0),
                                        child: Text('위 치 :${item?.location}'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 2.0),
                                        child: Text('인 원 : ${item?.recruitment}'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 2.0),
                                        child: Text('기 간 : ${item?.days}'),
                                      ),
                                      Text('내 용 : ${item?.story}'),

                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                        );

                      }
                  );
                }
                return const Center(child: CircularProgressIndicator(),
                );
              }),
      ),
    ])
    );}
}
