class WishSaveReq {
  int boardId;

  WishSaveReq({
    required this.boardId,
  });

  factory WishSaveReq.fromJson(Map<String, dynamic> json) => WishSaveReq(
    boardId: json["boardId"],
  );

  Map<String, dynamic> toJson() => {
    "boardId": boardId,
  };
}

class WishDeleteReq {
  int wishlistId;

  WishDeleteReq({
    required this.wishlistId,
  });

  factory WishDeleteReq.fromJson(Map<String, dynamic> json) => WishDeleteReq(
    wishlistId: json["wishlistId"],
  );

  Map<String, dynamic> toJson() => {
    "wishlistId": wishlistId,
  };
}
