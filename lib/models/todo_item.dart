class TodoItem {
  int id;
  String title;
  String desc;

  TodoItem({
    required this.id,
    required this.title,
    required this.desc,
  });

  @override
  String toString() {
    return "Todo{Id: $id, title: $title, description: $desc}";
  }

  factory TodoItem.fromJson(Map<String, Object?> json) =>
      TodoItem(id: json["id"] as int, title: json["title"] as String, desc: json["desc"] as String);

  Map<String, Object?> toJson() => {
    "id": id,
    "title": title,
    "desc": desc,
  };

  @override
  int get hashCode => Object.hash(id, title);

  @override
  bool operator ==(Object other) {
    return other is TodoItem &&
        other.title == title &&
        other.id == id;
  }
}
