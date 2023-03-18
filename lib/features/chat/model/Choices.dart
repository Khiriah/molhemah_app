import 'Message.dart';

class Choices {
  Choices({
      this.message, 
      this.finishReason, 
      this.index,});

  Choices.fromJson(dynamic json) {
    message = json['message'] != null ? Message.fromJson(json['message']) : null;
    finishReason = json['finish_reason'];
    index = json['index'];
  }
  Message? message;
  String? finishReason;
  int? index;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (message != null) {
      map['message'] = message!.toJson();
    }
    map['finish_reason'] = finishReason;
    map['index'] = index;
    return map;
  }

}