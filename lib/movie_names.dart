

//
// MovieName movieNameFromJson(String str) => MovieName.fromJson(json.decode(str));
//
// String movieNameToJson(MovieName data) => json.encode(data.toJson());
//
// class MovieName {
//   MovieName({
//     required this.items,
//     //required this.errorMessage,
//   });
//
//   final List<Item> items;
//
//
//   factory MovieName.fromJson(Map<String, dynamic> json) => MovieName(
//         items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
//        // errorMessage: json["errorMessage"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "items": List<dynamic>.from(items.map((x) => x.toJson())),
//         //"errorMessage": errorMessage,
//       };
// }
//
// class Item {
//   Item({
//     required this.id,
//     required this.rank,
//     required this.rankUpDown,
//     required this.title,
//     required this.fullTitle,
//     required this.year,
//     required this.image,
//     required this.crew,
//     required this.imDbRating,
//     required this.imDbRatingCount,
//   });
//
//   final String id;
//   final String rank;
//   final String rankUpDown;
//   final String title;
//   final String fullTitle;
//   final String year;
//   final String image;
//   final String crew;
//   final String imDbRating;
//   final String imDbRatingCount;
//
//   factory Item.fromJson(Map<String, dynamic> json) => Item(
//         id: json["id"],
//         rank: json["rank"],
//         rankUpDown: json["rankUpDown"],
//         title: json["title"],
//         fullTitle: json["fullTitle"],
//         year: json["year"],
//         image: json["image"],
//         crew: json["crew"],
//         imDbRating: json["imDbRating"],
//         imDbRatingCount: json["imDbRatingCount"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "rank": rank,
//         "rankUpDown": rankUpDown,
//         "title": title,
//         "fullTitle": fullTitle,
//         "year": year,
//         "image": image,
//         "crew": crew,
//         "imDbRating": imDbRating,
//         "imDbRatingCount": imDbRatingCount,
//       };
// }
