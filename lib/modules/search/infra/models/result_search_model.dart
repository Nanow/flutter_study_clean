import 'dart:convert';

import 'package:study_clean/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String img;
  final String title;
  final String content;

  ResultSearchModel({this.img, this.title, this.content});

  Map<String, dynamic> toMap() {
    return {
      'img': img,
      'title': title,
      'content': content,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResultSearchModel(
      img: map['avatar_url'],
      title: map['login'],
      content: map['content'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source));

  static List<ResultSearchModel> fromJsonList(List jsonList) {
    return jsonList.map((e) => ResultSearchModel.fromMap(e)).toList();
  }

  ResultSearchModel copyWith({
    String img,
    String title,
    String content,
  }) {
    return ResultSearchModel(
      img: img ?? this.img,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  @override
  String toString() =>
      'ResultSearchModel(img: $img, title: $title, content: $content)';
}
