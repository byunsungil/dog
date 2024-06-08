import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VolunteerDetailScreen extends StatefulWidget {
  final String volunteerId;

  const VolunteerDetailScreen({Key? key, required this.volunteerId}) : super(key: key);

  @override
  _VolunteerDetailScreenState createState() => _VolunteerDetailScreenState();
}

class _VolunteerDetailScreenState extends State<VolunteerDetailScreen> {
  late Stream<DocumentSnapshot> _volunteerStream;

  @override
  void initState() {
    super.initState();
    // 해당 봉사활동 문서 스트림 설정
    _volunteerStream = FirebaseFirestore.instance.collection('cate').doc(widget.volunteerId).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('봉사활동 신청 현황'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _volunteerStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            // 봉사활동 문서 데이터 가져오기
            Map<String, dynamic>? volunteerData = snapshot.data!.data() as Map<String, dynamic>?;
            if (volunteerData != null) {
              // 신청자 목록 가져오기
              List<dynamic> applicants = volunteerData['applicants'] ?? [];
              return ListView.builder(
                itemCount: applicants.length,
                itemBuilder: (context, index) {
                  // 각 신청자의 정보 표시
                  return ListTile(
                    title: Text('UID: ${applicants[index]['uid']}'),
                    subtitle: Text('Email: ${applicants[index]['email']}'),
                  );
                },
              );
            }
          }
          // 데이터가 없는 경우 또는 오류 발생 시 기본 빈 화면 반환
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
