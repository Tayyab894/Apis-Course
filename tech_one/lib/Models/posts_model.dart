// To parse this JSON data, do
//
//     final postsModel = postsModelFromMap(jsonString);

import 'dart:convert';

List<PostsModel> postsModelFromMap(String str) => List<PostsModel>.from(json.decode(str).map((x) => PostsModel.fromMap(x)));

String postsModelToMap(List<PostsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class PostsModel {
    int? userId;
    int? id;
    String? title;
    String? body;

    PostsModel({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    factory PostsModel.fromMap(Map<dynamic, dynamic> json) => PostsModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
