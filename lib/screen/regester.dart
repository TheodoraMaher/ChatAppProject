import 'package:chat_project/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../component/botton.dart';
import '../component/custom_text_field.dart';
import '../helper/show-snack-bar.dart';
import 'Chat_page.dart';
import 'login.dart';

class Regester_page extends StatefulWidget {
  Regester_page({Key? key}) : super(key: key);

  static String id = 'RegesterPage';

  @override
  State<Regester_page> createState() => _Regester_pageState();
}

class _Regester_pageState extends State<Regester_page> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KPrimarycolor,
      ),
      backgroundColor: KPrimarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 75,
              ),
              Image.asset(
                'assets/images/scholar.png',
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Scholar Chat',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 75,
              ),
              Row(
                children: [
                  Text(
                    ' SIGN UP',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomFormtextfield(
                onChanged: (data) {
                  email = data;
                },
                hintText: 'Email',
              ),
              SizedBox(
                height: 10,
              ),
              CustomFormtextfield(
                onChanged: (data) {
                  password = data;
                },
                hintText: 'Password',
              ),
              SizedBox(
                height: 20,
              ),
              custom_button(
                onTap: () async {
                  if (formKey.currentState!.validate()) {


                      try {
                        await registerUser();

                        Navigator.pushNamed(context, Chat_Page.id);



                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-password') {
                          showSnackBar(context, 'week password');
                        } else if (ex.code == 'email-already-in-use') {
                          showSnackBar(context, 'email already exists');
                        }
                      } catch (ex) {
                        showSnackBar(context, 'there was as error');
                      }
                    }

                }, 
                text: 'Regester',
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'you have account',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      ' login',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
