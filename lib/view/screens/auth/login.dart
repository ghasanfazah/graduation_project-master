import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marketing_graduation/core/constant/imageassate.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marketing_graduation/core/functions/alirt_loading.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  bool _obscure = true;
  var myEmail, myPassword;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  UserCredential? userCredential;

  signIn() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      try {
        alirtLoading(context, 'الرجاء الانتظار');
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: myEmail, password: myPassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Navigator.pop(context);
          AwesomeDialog(
                  dialogType: DialogType.error,
                  context: context,
                  title: '!البريد الالكتروني غير صحيح',
                  desc: 'عليك اعادة كتابة البريدالالكتروني بشكل صحيح')
              .show();
        } else if (e.code == 'wrong-password') {
          Navigator.pop(context);
          AwesomeDialog(
            dialogType: DialogType.error,
            context: context,
            title: 'كلمة المرور غير صحيحة!',
            desc: 'عليك اعادة كتابة كلمة المرور بشكل صحيح',
          ).show();
        }if(e.code == 'wrong-password'&&e.code == 'user-not-found'){
          Navigator.pop(context);
          AwesomeDialog(
            dialogType: DialogType.error,
            context: context,
            title: 'خطأ!',
            desc: 'عليك اعادة كتابة كلمة المرور والبريد الالكتروني بشكل صحيح',
          ).show();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(ImageAssets.imageLogo),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'أهلا وسهلا بك',
                  style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'سجل حسابك الشخصي',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: formState,
                  child: Column(
                    children: [
                      TextFormField(
                        onSaved: (val) {
                          myEmail = val;
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'لا يمكن لحقل البريد الالكترني أن يترك فارغ';
                          }
                          if (val.length > 30) {
                            return 'لا يمكن ادخال لأكثر من 30 خانة';
                          } else if (val.length < 3) {
                            return 'يجب ادخال اكثر من 3 خانات';
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'البريد الالكتروني',
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscure,
                        onSaved: (val) {
                          myPassword = val;
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'لا يمكن لحقل كلمة المرورأن يترك فارغ';
                          }
                          if (val.length > 30) {
                            return 'لا يمكن ادخال لأكثر من 30 خانة';
                          }
                          if (val.length < 6) {
                            return 'يجب ادخال اكثر من 3 خانات';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'كلمة المرور',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscure = !_obscure;
                              });
                            },
                            icon: Icon(
                              _obscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(width: 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'هل نسيت كلمة المرور؟',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 255, 30, 0)),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: const Color.fromARGB(255, 255, 30, 0)),
                    onPressed: () async {
                      userCredential = await signIn();
                      if (userCredential != null) {
                        Navigator.pushReplacementNamed(context, '/bn_screen');
                      }
                    },
                    child: const Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'او',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                          minimumSize: const Size(150, 50)),
                      onPressed: () async {
                      print("Ahmed");
                        userCredential = await signInWithGoogle();
                        if (userCredential != null) {
                          Navigator.pushReplacementNamed(
                              context, '/bn_screen');
                        }
                      },
                      label: const Text(
                        'جوجل',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700,fontSize: 18),
                      ),
                      icon: Image.asset(
                        ImageAssets.googleIcon,
                        width: 35,
                      ),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register_screen');
                      },
                      child: const Text('انشاء حساب',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 255, 30, 0))),
                    ),
                    const Text(
                      "ليس لديك حساب؟",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
