import 'package:app_bloc_example/application/cubits/task_cubit/task_cubit_base_state.dart';
import 'package:app_bloc_example/application/cubits/task_cubit/task_cubit_loading_state.dart';
import 'package:app_bloc_example/application/cubits/task_cubit/task_cubit_state.dart';
import 'package:app_bloc_example/application/utils/snackbar_utils.dart';
import 'package:app_bloc_example/application/view_models/task_form_view_model.dart';
import 'package:app_bloc_example/application/widgets/buttons/button_primary_widget.dart';
import 'package:app_bloc_example/application/widgets/fields/dropdown_form_field_widget.dart';
import 'package:app_bloc_example/application/widgets/fields/text_form_field_widget.dart';
import 'package:app_bloc_example/application/widgets/fields/textarea_form_field_widget.dart';
import 'package:app_bloc_example/core/models/status_response.dart';
import 'package:app_bloc_example/domain/enums/priority.dart';
import 'package:app_bloc_example/domain/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskFormPage extends StatelessWidget {

  final Task? task;

  TaskFormPage({ 
    Key? key,
    this.task 
  }) : super(key: key) {
    taskFormVM = TaskFormViewModel(
      task: task
    );
  }

  late final TaskFormViewModel taskFormVM;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          task == null ? "Registrar tarefa" : "Editar tarefa"
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: taskFormVM.formKey,
          child: Column(
            children: [
              TextFormFieldWidget(
                label: "Nome",
                controller: taskFormVM.nameController,
                keyboardType: TextInputType.name,
                validator: taskFormVM.validateName,
              ),
              const SizedBox(
                height: 20,
              ),
              TextareaFormFieldWidget(
                label: "Descrição",
                controller: taskFormVM.descriptionController,
                validator: taskFormVM.validateDescription,
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownFormFieldWidget<Priority>(
                value: taskFormVM.priority,
                validator: taskFormVM.validatePriority,
                onGenerateDescription: (priority) {
                  switch(priority) {
                    case Priority.normal:
                      return "Normal";
                    case Priority.medium:
                      return "Média";
                    case Priority.high:
                      return "Alta";
                    default:
                      return "Selecione";
                  }
                },
                items: Priority.values, 
                onChanged: (priority) {
                  taskFormVM.priority = priority;
                }, 
                label: "Prioridade da tarefa",
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<TaskCubitState, TaskCubitBaseState>(
                /* Aqui foi mudado o nome para contextBuilder para evitar erro na perca de contexto
                 * ao chamar o Snackbar utilizando o contexto. Isso pq a cada vez que atualiza o 
                 * BlocBuilder, o contexto muda e o antigo se perde.
                 */
                builder: (contextBuilder, state) {
                  return ButtonPrimaryWidget(
                    loading: state is TaskCubitLoadingState,
                    text: task == null ? "Registrar" : "Editar", 
                    onPressed: () async {
                      
                      late StatusResponse result;
                      
                      if(taskFormVM.id == null) {
                        result = await context.read<TaskCubitState>().add(taskFormVM);
                      } else {
                        result = await context.read<TaskCubitState>().update(taskFormVM);
                      }

                      SnackbarUtils.showSnackbarStatusResponse(context: context, statusResponse: result);

                      if(result.isSuccess) {
                        Navigator.of(context).pop();
                      }
                    },
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}