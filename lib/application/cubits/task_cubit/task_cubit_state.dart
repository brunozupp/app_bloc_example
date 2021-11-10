import 'package:app_bloc_example/application/cubits/task_cubit/task_cubit_base_state.dart';
import 'package:app_bloc_example/application/cubits/task_cubit/task_cubit_error_state.dart';
import 'package:app_bloc_example/application/cubits/task_cubit/task_cubit_init_state.dart';
import 'package:app_bloc_example/application/cubits/task_cubit/task_cubit_loading_state.dart';
import 'package:app_bloc_example/application/cubits/task_cubit/tasks_cubit_list_state.dart';
import 'package:app_bloc_example/application/view_models/task_form_view_model.dart';
import 'package:app_bloc_example/core/models/status_response.dart';
import 'package:app_bloc_example/domain/models/task.dart';
import 'package:app_bloc_example/domain/services/interfaces/task_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCubitState extends Cubit<TaskCubitBaseState> {
  
  final TaskService _taskService;

  TaskCubitState({required TaskService taskService}) :
    _taskService = taskService, 
    super(TaskCubitInitState());

  final List<Task> _tasks = List<Task>.empty(growable: true);
  List<Task> get tasks => _tasks;

  bool _hasAlreadyGetTasks = false;

  // Como estou utilizando o FutureBuilder para chamar essa função, não preciso setar o loading aqui
  Future<StatusResponse> getAll() async {

    if(_hasAlreadyGetTasks) {
      emit(TasksCubitListState(tasks: _tasks));
    }

    emit(TaskCubitLoadingState());
    
    final result = await _taskService.getAll();

    if(result.data != null) {
      _hasAlreadyGetTasks = true;
      emit(TasksCubitListState(tasks: result.data!));
    } else {
      emit(TaskCubitErrorState());
    }

    return StatusResponse.fromResponseModel(responseModel: result);
  }

  Future<StatusResponse> add(TaskFormViewModel taskFormViewModel) async {
    
    emit(TaskCubitLoadingState());

    final result = await _taskService.insert(taskFormViewModel);

    if(result.data != null) {
      _tasks.add(result.data!);
      emit(TasksCubitListState(tasks: _tasks));
    } else {
      emit(TaskCubitErrorState());
    }

    return StatusResponse.fromResponseModel(responseModel: result);
  }

  Future<StatusResponse> update(TaskFormViewModel taskFormViewModel) async {

    emit(TaskCubitLoadingState());
    
    final result = await _taskService.update(taskFormViewModel);

    if(result.data != null) {
      _tasks.removeWhere((task) => task.id == taskFormViewModel.id);
      _tasks.add(result.data!);
      emit(TasksCubitListState(tasks: _tasks));
    } else {
      emit(TaskCubitErrorState());
    }

    return StatusResponse.fromResponseModel(responseModel: result);
  }

  Future<StatusResponse> delete(dynamic id) async {

    emit(TaskCubitLoadingState());
    
    final result = await _taskService.delete(id);

    if(result.data != null) {
      _tasks.removeWhere((task) => task.id == id);
      emit(TasksCubitListState(tasks: _tasks));
    } else {
      emit(TaskCubitErrorState());
    }

    return StatusResponse.fromResponseModel(responseModel: result);
  }

}