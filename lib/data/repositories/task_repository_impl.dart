import 'package:app_bloc_example/core/models/response_model.dart';
import 'package:app_bloc_example/data/repositories/interfaces/task_repository.dart';
import 'package:app_bloc_example/domain/enums/priority.dart';
import 'package:app_bloc_example/domain/models/task.dart';
import 'package:flutter/cupertino.dart';

final _tasks = <Task>[
  Task(name: "Tarefa 1", description: "Uma descrição um pouco divertida sobre o assunto em questão para ser levado em conta para a banca eleitoral levado em conta para a banca eleitoral levado em conta para a banca eleitoral", priority: Priority.normal),
  Task(name: "Tarefa 1", description: "Uma descrição um pouco divertida sobre o assunto em questão para ser levado em conta para a banca eleitoral levado em conta para a banca eleitoral levado em conta para a banca eleitoral", priority: Priority.normal),
  Task(name: "Tarefa 1", description: "Uma descrição um pouco divertida sobre o assunto em questão para ser levado em conta para a banca eleitoral levado em conta para a banca eleitoral levado em conta para a banca eleitoral", priority: Priority.normal),
  Task(name: "Tarefa 2", description: "Uma descrição um pouco divertida sobre o assunto em questão", priority: Priority.medium),
  Task(name: "Tarefa 3", description: "Uma descrição um pouco divertida sobre o assunto em questão para ser levado em conta para a banca eleitoral", priority: Priority.high),
  Task(name: "Tarefa 4", description: "Uma descrição um pouco divertida sobre o assunto em questão", priority: Priority.high),
  Task(name: "Tarefa 1", description: "Uma descrição um pouco divertida sobre o assunto em questão para ser levado em conta para a banca eleitoral levado em conta para a banca eleitoral levado em conta para a banca eleitoral", priority: Priority.normal),
  Task(name: "Tarefa 2", description: "Uma descrição um pouco divertida sobre o assunto em questão", priority: Priority.medium),
  Task(name: "Tarefa 3", description: "Uma descrição um pouco divertida sobre o assunto em questão para ser levado em conta para a banca eleitoral", priority: Priority.high),
  Task(name: "Tarefa 4", description: "Uma descrição um pouco divertida sobre o assunto em questão", priority: Priority.high),
  Task(name: "Tarefa 1", description: "Uma descrição um pouco divertida sobre o assunto em questão para ser levado em conta para a banca eleitoral levado em conta para a banca eleitoral levado em conta para a banca eleitoral", priority: Priority.normal),
  Task(name: "Tarefa 2", description: "Uma descrição um pouco divertida sobre o assunto em questão", priority: Priority.medium),
  Task(name: "Tarefa 3", description: "Uma descrição um pouco divertida sobre o assunto em questão para ser levado em conta para a banca eleitoral", priority: Priority.high),
  Task(name: "Tarefa 4", description: "Uma descrição um pouco divertida sobre o assunto em questão", priority: Priority.high),
];

class TaskRepositoryImpl implements TaskRepository {
  
  @override
  Future<ResponseModel<bool>> deleteById(id) async {
      
    try {

      _tasks.removeWhere((task) => task.id == id);

      await Future.delayed(const Duration(seconds: 1));

      return ResponseModel.success(data: true);

    } catch (e) {
      debugPrint(e.toString());
      return ResponseModel.error(message: "Erro ao deletar a tarefa");
    }
  }

  @override
  Future<ResponseModel<List<Task>>> getAll() async {
    try {

      return ResponseModel.success(data: _tasks);

    } catch (e) {
      debugPrint(e.toString());
      return ResponseModel.error(message: "Erro ao pegar as tarefa");
    }
  }

  @override
  Future<ResponseModel<Task>> insert(Task task) async {
    
    try {

      _tasks.add(task);

      await Future.delayed(const Duration(seconds: 1));

      return ResponseModel.success(data: task);

    } catch (e) {
      debugPrint(e.toString());
      return ResponseModel.error(message: "Erro ao salvar a tarefa");
    }
  }

  @override
  Future<ResponseModel<Task>> update(Task task) async {
    try {

      _tasks.removeWhere((element) => element.id == task.id);
      _tasks.add(task);

      await Future.delayed(const Duration(seconds: 1));

      return ResponseModel.success(data: task);

    } catch (e) {
      debugPrint(e.toString());
      return ResponseModel.error(message: "Erro ao editar a tarefa");
    }
  }

}