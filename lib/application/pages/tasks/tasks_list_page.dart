import 'package:app_bloc_example/application/pages/tasks/components/task_item_component.dart';
import 'package:app_bloc_example/domain/enums/priority.dart';
import 'package:app_bloc_example/domain/models/task.dart';
import 'package:flutter/material.dart';

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

class TasksListPage extends StatelessWidget {
  const TasksListPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.note_add_rounded,
        ),
        onPressed: () => Navigator.of(context).pushNamed("/tasks/form")
      ),
      body: _tasks.isEmpty
        ? const Center(
            child: Text(
              "Nenhuma tarefa foi registrada",
            ),
          )
        : ListView.separated(
            padding: const EdgeInsets.only(bottom: 100),
            itemCount: _tasks.length,
            separatorBuilder: (_,index) => const SizedBox(height: 10),
            itemBuilder: (_,index) {
              
              final task = _tasks[index];
              
              return GestureDetector(
                onTap: () => debugPrint(task.id),
                child: TaskItemComponent(
                  task: task
                ),
              );
            }
          ),
    );
  }
}