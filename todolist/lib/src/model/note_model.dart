// ignore_for_file: non_constant_identifier_names

// ignore: duplicate_ignore
class Note {
  int? id;
  String? title;
  String? description;
  DateTime? deadline;
  int? status;

  Note({this.title, this.description, this.deadline, this.status});

  Note.withId(
      {this.id, this.title, this.description, this.deadline, this.status});

  Map<String, dynamic> toMap() {
    // ignore: prefer_collection_literals
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['description'] = description;
    map['deadline'] = deadline!.toIso8601String();
    map['status'] = status;
    return map;
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note.withId(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      deadline: DateTime.parse(map['deadline']),
      status: map['status'],
    );
  }

  @override
  String toString() {
    return 'Note{id: $id, title: $title, description: $description, deadline: $deadline, status: $status}';
  }
}
