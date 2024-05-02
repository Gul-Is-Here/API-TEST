import 'dart:convert';

class Welcome {
    final int userId;
    final int id;
    final String title;
    final String body;

    Welcome({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory Welcome.fromRawJson(String str) => Welcome.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
