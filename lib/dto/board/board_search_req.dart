class BoardSearchReq {
  String word;

  BoardSearchReq({
    required this.word,
  });

  factory BoardSearchReq.fromJson(Map<String, dynamic> json) => BoardSearchReq(
    word: json["word"],
  );

  Map<String, dynamic> toJson() => {
    "word": word,
  };
}
