import 'package:chat_project/screen/Chat_page.dart';
import 'package:chat_project/screen/cubit/chatState/chat_cubit.dart';
import 'package:chat_project/screen/cubit/login_cubit.dart';
import 'package:chat_project/screen/cubit/regester_cubit/register_cubit.dart';
import 'package:chat_project/screen/login.dart';
import 'package:chat_project/screen/regester.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ChatCubit()),

      ],
      child: MaterialApp(
        routes: {
          login.id: (context) => login(),
          Regester_page.id: (context) => Regester_page(),
          Chat_Page.id: (context) => Chat_Page(),

        },
        initialRoute: login.id,
      ),
    );
  }
}

