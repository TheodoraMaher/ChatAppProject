import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../constants.dart';
import '../../../models/messages.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference message =
  FirebaseFirestore.instance.collection(KeyMessagesCollections);
  List<Message> messagesList = [];
  void sendMessage ({required String messages , required String email})
  {
      try {
        message.add({
          KeyMessages : messages,
          KCreatedAt: DateTime.now(),
          'id': email,});
      } on Exception catch (e) {
        // TODO
      }
        //print('email')

  }

  void getMessages(){
    message.orderBy(KCreatedAt, descending: true).snapshots().listen((event) {
      messagesList.clear();
      for(var doc in event.docs){
        messagesList.add(Message.fromJson(doc));
      }
      print('succes');
      emit(ChatSuccess(messages: messagesList));
    });
  }
}
