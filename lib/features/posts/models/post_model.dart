class PostDataModel {
  int userId;
  int id;
  String title;
  String body;

//<editor-fold desc="Data Methods">
  PostDataModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PostDataModel &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          id == other.id &&
          title == other.title &&
          body == other.body);

  @override
  int get hashCode =>
      userId.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;

  @override
  String toString() {
    return 'Post{ userId: $userId, id: $id, title: $title, body: $body,}';
  }

  PostDataModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostDataModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostDataModel.fromMap(Map<String, dynamic> map) {
    return PostDataModel(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] ?? "",
      body: map['body'] ?? "",
    );
  }

//</editor-fold>
}
