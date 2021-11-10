import 'package:app_bloc_example/application/cubits/task_cubit/task_cubit_base_state.dart';
import 'package:app_bloc_example/domain/models/task.dart';
import 'package:flutter/material.dart';

@immutable
class TasksCubitListState extends TaskCubitBaseState {

  final List<Task> _tasks;
  List<Task> get tasks => _tasks;

  const TasksCubitListState({required List<Task> tasks})
    : _tasks = tasks;

}