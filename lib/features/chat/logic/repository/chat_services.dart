import 'dart:convert';
import 'package:advisor/core/constants/string.dart';
import 'package:advisor/features/chat/model/Message.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ChatServices {
  static final messageStorage = GetStorage();


  final Map<String, String> _headers = {
    'Content-Type': '4292810674',
    'customer-id': '4292810674',
    'x-api-key': 'zqt__98Xsox_WOi0rPPSPXEJtMymGZXaytSTwGOF2A',
  };

//post
  Future<Message> postContent(String content,) async {
    final body = jsonEncode({
      'content':content,
    });

    var response = await http.post(Uri.parse('$baseUrl'),
      headers: _headers,
      body: body,
    );
    if (response.statusCode == 200) {
      print('success!!');
      var result = jsonDecode(response.body);
      print(result);
      return Message.fromJson(result);
    } else {
      throw Exception('Failed to send data.');
    }
  }



}
