import 'dart:convert';
import 'package:advisor/features/chat/model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
 import 'package:http/http.dart';


class ChatController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var chatList = <ChatModel>[].obs;
  var isLoading = true.obs;
  var stoarge = GetStorage();

  final

  TextEditingController chatController = TextEditingController();

  List token = [];
  var userMessage = [];
  Future<void> makePostRequest(input) async {
    final url =
    Uri.parse('https://experimental.willow.vectara.io/v1/chat/completions');
    final headers = {
      'Content-Type': 'application/json',
      'customer-id': '4292810674',
      'x-api-key': 'zqt__98Xsox_WOi0rPPSPXEJtMymGZXaytSTwGOF2A'
    };
    final json = jsonEncode(({
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "user", "content": input}
      ]
    }));
    final response = await post(url, headers: headers, body: json);
    Map<String, dynamic> data = jsonDecode(response.body);
    token.add(data["choices"][0]["message"]['content']);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    print(token);
    userMessage.add(chatController.text);
    update();
  }

}
