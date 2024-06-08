
import 'dart:async';

import 'package:capdog/model/cate.dart';
import 'package:capdog/model/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class VolunteerAddScreen extends StatefulWidget {
  const VolunteerAddScreen({super.key});


  @override
  State<VolunteerAddScreen> createState() => _VolunteerAddScreenState();
}

class _VolunteerAddScreenState extends State<VolunteerAddScreen> {

  final _formkey = GlobalKey<FormState>();

  bool isRecruit = false; // 모집중
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  Cate? selectedCate;

  TextEditingController titleTEC = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController recruitment = TextEditingController();
  TextEditingController days = TextEditingController();
  TextEditingController story = TextEditingController();
  List<Cate> cateItems = [];

  Future<List<Cate>> _fetchCate() async {
    final resp = await db.collection('cate').get();
    for(var doc in resp.docs) {
      cateItems.add(Cate(
        docId: doc.id,
        title: doc.data()['title'],
      ));
    }
    setState(() {
      selectedCate = cateItems.first;
    });
    return cateItems;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchCate();
  }

  Future addVolunteer()async{
    final sampleData = Cate(
      title: titleTEC.text,
      location: location.text,
      recruitment: int.parse(recruitment.text),
      isSale: isRecruit,
      days: days.text.isNotEmpty
        ? int.parse(days.text)
          : 0,
      story: story.text,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );

    final doc = await db.collection('cate').add(sampleData.toJson());
    await doc.collection('category').add(selectedCate?.toJson() ?? {});
    final cateRef = db.collection('category').doc(selectedCate?.docId);
    await cateRef.collection('cate').add({'docId': doc.id});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('봉사활동 등록'),
        actions: [
          IconButton(onPressed: () {
            addVolunteer();
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('봉사활동이 성공적으로 등록되었습니다.'),
                ));
          }, icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: titleTEC,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '제목',
                      hintText: '제목을 입력하세요'
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return '제목을 입력 해주세요';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16,),
                  TextFormField(
                    controller: location,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "위치(기관명)",
                    ),
                    maxLength: 70,
                    keyboardType: TextInputType.multiline,
                      validator: (value) {
                      if(value == null || value.isEmpty) {
                        return '필수 입력 항목 입니다';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: recruitment,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "모집인원(명)",
                      hintText: '인원수를 입력해주세요'
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return '필수 입력 항목 입니다.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16,),
                  TextFormField(
                    controller: story,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '내용',
                      hintText: '내용을 입력해주세요'
                    ),
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return '필수 입력 항목 입니다.';
                      }
                      return null;
                    },
                  ),
                  SwitchListTile.adaptive(
                      value: isRecruit,
                      onChanged: (v) {
                        setState(() {
                          isRecruit = v;
                        });
                      },
                    title: const Text('한시모집'),
                  ),
                  if(isRecruit)
                    TextFormField(
                      controller: days,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '모집기간',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return null;
                      },
                    ),
                ],
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
