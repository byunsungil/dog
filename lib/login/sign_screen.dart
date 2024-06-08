import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {

  final _formkey = GlobalKey<FormState>();

  TextEditingController emailTextController = TextEditingController();
  TextEditingController pwdTextController = TextEditingController();

  Future<bool> signUp(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.
      createUserWithEmailAndPassword(email: emailAddress, password: password);
      await FirebaseFirestore.instance.collection('users').add({
        'uid' : credential.user?.uid ?? '',
        'email' : credential.user?.email ?? ''
      });
      return true;
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('패스워드가 약합니다');
      } else if (e.code == 'email-already-in-use') {
        print('이미 정보가 존재합니다');
      }
      return false;
    }
    catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset('assets/aidog.jpeg'),
              Text('가입을 환영합니다!',style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(
                height: 32,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailTextController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'e-mail',
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty) {
                          return "이메일 주소를 입력하세요.";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: pwdTextController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'pw',
                      ),
                      obscureText: true,
                      validator: (value){
                        if(value == null || value.isEmpty) {
                          return "비밀번호를 입력하세요.";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 18,),
              MaterialButton(
                  onPressed: ()async {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();

                      final result = await signUp(emailTextController.text.trim(),
                          pwdTextController.text.trim(),
                      );
                      if (result) {
                        if(context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('가입 완료')),
                          );
                          context.go('/login');
                        }
                      } else{
                        if(context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('가입 실패'))
                    );
                        }
                      }
                    }
                  },
              height: 48,
              minWidth: double.infinity,
              color: Colors.indigo,
              child: Text(
                '회원가입',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
