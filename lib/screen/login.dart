import 'package:chat_project/screen/Chat_page.dart';
import 'package:chat_project/screen/cubit/chatState/chat_cubit.dart';
import 'package:chat_project/screen/cubit/login_cubit.dart';
import 'package:chat_project/screen/regester.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../component/botton.dart';
import '../component/custom_text_field.dart';
import '../constants.dart';
import '../helper/show-snack-bar.dart';


class login extends StatelessWidget {
  static String id = 'login';
  bool isLoading = false;
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginLoading){
          isLoading=true;
        }else if( state is LoginSuccess){
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.pushNamed(context, Chat_Page.id , arguments: email);
          isLoading=false;
        }else if(state is LoginFailure){
          showSnackBar(context, state.errorMessage);
          isLoading=false;
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: KPrimarycolor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  SizedBox(height: 75,),
                  Image.asset('assets/images/scholar.png',
                    height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Scholar Chat',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 75,),

                  Row(
                    children: [
                      Text(' SIGN IN',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  CustomFormtextfield(
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: 'Email',
                  ),
                  SizedBox(height: 10,),

                  CustomFormtextfield(
                    obscureText: true,
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: 'Password',
                  ),
                  SizedBox(height: 20,),

                  custom_button(

                    onTap: () async {

                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context).
                        loginUser(email: email!, password: password!);
                      } else {

                      }
                    },

                    text: 'login',
                  ),
                  SizedBox(height: 15,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('DONT HAVE AN ACCOUNT??',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Regester_page.id);
                        },
                        child: Text(' REGISTER',
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
        ),
      ),
    );
  }


  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: email!, password: password!);
  }
}






