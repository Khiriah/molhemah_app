import 'package:advisor/features/chat/logic/repository/chat_services.dart';
import 'package:advisor/features/chat/model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';


class ChatController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var chatList = <ChatModel>[].obs;
  var isLoading = true.obs;
  var stoarge = GetStorage();
  final chatService = ChatServices();

  final

  TextEditingController chatController = TextEditingController();


  Future<void> postContent({
    required String content,
  }) async {
    try {
      await chatService.postContent(content);
    } catch (error) {

    }
  }

}
