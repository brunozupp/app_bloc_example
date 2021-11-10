import 'dart:convert';

import 'package:app_bloc_example/domain/enums/priority.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:uuid/uuid.dart';

class Task {
  
  String? id;
  String name;
  String description;
  Priority priority;

  Task({
    this.id,
    required this.name,
    required this.description,
    required this.priority,
  }) {
    id ??= const Uuid().v4();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'priority': EnumToString.convertToString(priority),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      priority: EnumToString.fromString(Priority.values, map['priority'])!,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));
}
