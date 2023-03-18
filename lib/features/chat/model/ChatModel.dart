import 'dart:convert';

import 'Usage.dart';
import 'Choices.dart';

List<ChatModel> ChatModelFromJson(String str) =>
    List<ChatModel>.from(
        json.decode(str).map((x) => ChatModel.fromJson(x)));

String ChatModelToJson(List<ChatModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatModel {
  String? id;
  String? object;
  int? created;
  String? model;
  Usage? usage;
  List<Choices>? choices;

  ChatModel({
    this.id,
    this.object,
    this.created,
    this.model,
    this.usage,
    this.choices,
  });

  ChatModel.fromJson(dynamic json) {
    id = json['id'];
    object = json['object'];
    created = json['created'];
    model = json['model'];
    usage = json['usage'] != null ? Usage.fromJson(json['usage']) : null;
    if (json['choices'] != null) {
      choices = [];
      json['choices'].forEach((v) {
        choices!.add(Choices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['object'] = object;
    map['created'] = created;
    map['model'] = model;
    if (usage != null) {
      map['usage'] = usage!.toJson();
    }
    if (choices != null) {
      map['choices'] = choices!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
