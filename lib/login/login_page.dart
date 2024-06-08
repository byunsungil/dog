import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formkey = GlobalKey<FormState>();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController pwdTextController = TextEditingController();

  Future<UserCredential?> signIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.
      signInWithEmailAndPassword(email: email, password: password);
      print(credential);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print(e.toString());

      } else if (e.code == 'wrong-password') {
        print(e.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<UserCredential?> signInWithGoogle() async{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(90.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/aidog.jpeg"),
              Text(
                  "AiDog",
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 32),
              ),
              SizedBox(
                height: 6,
              ),
              Form(
                key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailTextController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "e-mail",
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "이메일 주소를 입력하세요.";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: pwdTextController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "pw",
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "비밀번호를 입력하세요.";
                          }
                          return null;
                        },
                      ),
                    ],
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(top:8),
                child: MaterialButton(
                    onPressed: () async {
                      if(_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        final result = await signIn(
                            emailTextController.text.trim(),
                            pwdTextController.text.trim()
                        );

                        if (result == null) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('로그인 실패'),
                              ),
                            );
                          }
                            return;
                          }
                        if (context.mounted) {
                          context.go("/");
                        }
                      }
                    },
                  height: 48,
                  minWidth: double.infinity,
                  color: Colors.indigo,
                  child: const Text(
                      '로그인',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => context.push('/sign'),
                child: Text('계정이없나요? 회원가입.'),
              ),
              const Divider(),
              InkWell(
                onTap: () async {
                  final userCredit = await signInWithGoogle();

                  if (userCredit == null) {
                    return;
                  }
                  if(context.mounted) {
                    context.go("/");
                  }


                },
                  child: Image.asset('assets/goo.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
