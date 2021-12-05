import 'dart:convert';

import 'user.dart';
import 'package:intl/intl.dart';

class Message {
  static const String dateFormat = "yyyy-dd-MMTHH:mm:ss.SSSZ";
  int? id;
  User? author;
  DateTime? created_at;
  final String content;

  Message(this.id, this.author, this.content, this.created_at);

  Message.name(this.content);

  Message.fromJson(Map<String, dynamic> json):
    id = json['id'],
    author = User.fromJson(json['author']),
    created_at = DateFormat(dateFormat).parse(json['created_at']),
    content = json['content'] != null ? json['content'] : "null";

  Map<String, dynamic> toJson() => {
    'id' : id,
    'author' : author?.toJson().toString(),
    'created_at' : DateFormat(dateFormat).format(created_at!),
    'content' : content
    };
}
