import 'package:donut/model/board/board.dart';
import 'package:donut/model/category/category.dart';
import 'package:donut/model/my_location/my_location.dart';


class BoardHomePageResponseDto {
  List<Category> myCategories;
  Location myLocation;
  List<Board> boards;

  BoardHomePageResponseDto({
    required this.myCategories,
    required this.myLocation,
    required this.boards,
  });

  factory BoardHomePageResponseDto.fromJson(Map<String, dynamic> json) => BoardHomePageResponseDto(
    myCategories: List<Category>.from(json["myCategories"].map((x) => Category.fromJson(x))),
    myLocation: Location.fromJson(json["myLocation"]),
    boards: List<Board>.from(json["boards"].map((x) => Board.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "myCategories": List<dynamic>.from(myCategories.map((x) => x.toJson())),
    "myLocation": myLocation.toJson(),
    "boards": List<dynamic>.from(boards.map((x) => x.toJson())),
  };
}