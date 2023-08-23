import 'package:chat_project/constants.dart';
import 'package:chat_project/models/messages.dart';
import 'package:chat_project/screen/cubit/chatState/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/Chat_Buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chat_Page extends StatelessWidget {
  static String id = 'Chat_Page';

  final _controller = ScrollController();
  List<Message> messagesList = [];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute
        .of(context)!
        .settings
        .arguments;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: KPrimarycolor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(KLogo,
              height: 50,),
            Text('Chat'),
          ],
        ),
        centerTitle: true,

      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                var messagesList =
                    BlocProvider.of<ChatCubit>(context).messagesList;
                return ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email ?
                      Chat_Bubble(
                        message: messagesList[index],
                      ) : Chat_Bubble_ForFriend(
                        message: messagesList[index],);
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(messages: data, email: email.toString());
                controller.clear();
                _controller.animateTo(0,
                  duration: Duration(microseconds: 500),
                  curve: Curves.easeIn,
                );
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: Icon(
                  Icons.send,
                  color: KPrimarycolor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: KPrimarycolor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
