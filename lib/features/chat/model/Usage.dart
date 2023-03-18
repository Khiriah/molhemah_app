class Usage {
  Usage({
      required this.promptTokens,
      required this.completionTokens,
      required this.totalTokens,});

  Usage.fromJson(dynamic json) {
    promptTokens = json['prompt_tokens'];
    completionTokens = json['completion_tokens'];
    totalTokens = json['total_tokens'];
  }
  int? promptTokens;
  int? completionTokens;
  int? totalTokens;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['prompt_tokens'] = promptTokens;
    map['completion_tokens'] = completionTokens;
    map['total_tokens'] = totalTokens;
    return map;
  }

}