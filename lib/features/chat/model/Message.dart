import 'dart:convert';

List<Message> MessageFromJson(String str) =>
    List<Message>.from(
        json.decode(str).map((x) => Message.fromJson(x)));

String MessageToJson(List<Message> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Message {
  Message({
      this.role, 
      this.content,});

  Message.fromJson(dynamic json) {
    role = json['role'];
    content = json['content'];
  }
  String? role;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role'] = role;
    map['content'] = content;
    return map;
  }

}