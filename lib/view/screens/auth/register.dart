import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marketing_graduation/core/constant/imageassate.dart';
import 'package:marketing_graduation/core/functions/alirt_loading.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  var myUsername, myEmail, myPassword;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  UserCredential? userCredential;

  register() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      try {
        alirtLoading(context, 'الرجاء الانتظار');
        userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: myEmail,
          password: myPassword,
        );
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Navigator.pop(context);
          AwesomeDialog(
                  dialogType: DialogType.error,
                  context: context,
                  title: 'كلمة المرور غير صحيحة!',
                  desc: 'عليك اعادة كلمة المرور بشكل صحيح')
              .show();
        } else if (e.code == 'email-already-in-use') {
          Navigator.pop(context);
          AwesomeDialog(
            dialogType: DialogType.error,
            context: context,
            title: 'البريد الالكتروني غير صحيح!',
            desc: 'عليك اعادة كتابة البريدالالكتروني بشكل صحيح',
          ).show();
        }
      } catch (e) {
        print(e);
      }
    }
  }

  bool _obscure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(ImageAssets.imageLogo),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'انشاء حساب',
                  style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'انشاء حساب جديد',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 30,
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
                          myUsername = val;
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'لا يمكن لاسم المستخدم أن يترك فارغا';
                          }
                          if (val.length > 30) {
                            return 'لا يمكن ادخال لأكثر من 30 خانة';
                          } else if (val.length < 3) {
                            return 'يجب ادخال اكثر من 3 خانات';
                          }
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'اسم المستخدم',
                          prefixIcon: const Icon(Icons.person),
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
                        onSaved: (val) {
                          myEmail = val;
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'لا يمكن أن يكون فارغ';
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
                            return 'لا يمكن أن يكون فارغ';
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
                                  ? Icons.visibility
                                  : Icons.visibility_off,
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
                const SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: const Color.fromARGB(255, 255, 30, 0),
                    ),
                    onPressed: () async {
                      userCredential = await register();
                      if (userCredential != null) {
                        Navigator.pushReplacementNamed(
                            context, '/bn_screen');
                      }
                    },
                    child: const Text(
                      'انشاء حساب',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login_screen');
                      },
                      child: const Text('سجل الدخول',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 255, 30, 0))),
                    ),
                    const Text(
                      "هل لديك حساب؟",
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
