import 'package:app_bloc_example/application/cubits/task_cubit/task_cubit_base_state.dart';
import 'package:app_bloc_example/application/cubits/task_cubit/task_cubit_error_state.dart';
import 'package:app_bloc_example/application/cubits/task_cubit/task_cubit_init_state.dart';
import 'package:app_bloc_example/application/cubits/task_cubit/task_cubit_loading_state.dart';
import 'package:app_bloc_example/application/cubits/task_cubit/task_cubit_state.dart';
import 'package:app_bloc_example/application/cubits/task_cubit/tasks_cubit_list_state.dart';
import 'package:app_bloc_example/application/pages/default/error_page.dart';
import 'package:app_bloc_example/application/pages/default/loading_page.dart';
import 'package:app_bloc_example/application/pages/tasks/components/task_item_component.dart';
import 'package:app_bloc_example/domain/enums/priority.dart';
import 'package:app_bloc_example/domain/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocBuilder<TaskCubitState, TaskCubitBaseState>(
        builder: (contextFromBuilder, state) {

          if(state is TaskCubitErrorState) {
            return const ErrorPage(
              text: "Erro na geração do estado",
            );
          }

          if(state is TaskCubitInitState) {
            print("ENTROU AQUI");
            contextFromBuilder.read<TaskCubitState>().getAll();
            return const LoadingPage();
          }

          if(state is TaskCubitLoadingState) {
            return const LoadingPage();
          }

          if(state is TasksCubitListState) {
            return state.tasks.isEmpty
              ? const Center(
                  child: Text(
                    "Nenhuma tarefa foi registrada",
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.only(bottom: 100),
                  itemCount: state.tasks.length,
                  separatorBuilder: (_,index) => const SizedBox(height: 10),
                  itemBuilder: (_,index) {
                    
                    final task = state.tasks[index];
                    
                    return TaskItemComponent(
                      task: task,
                      contextFromList: context,
                    );
                  }
                );
          }

          return Container();
        }
      ),
      
    );
  }
}