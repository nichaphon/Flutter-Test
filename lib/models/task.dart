import 'package:flutter/cupertino.dart';

class Task {
  final id;
  final title;
  final description;
  Task({this.id, this.title, this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
