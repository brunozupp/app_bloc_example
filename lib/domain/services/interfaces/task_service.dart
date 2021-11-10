import 'package:app_bloc_example/application/view_models/task_form_view_model.dart';
import 'package:app_bloc_example/core/models/response_model.dart';
import 'package:app_bloc_example/domain/models/task.dart';

abstract class TaskService {
  
  Future<ResponseModel<List<Task>>> getAll();

  Future<ResponseModel<Task>> insert(TaskFormViewModel taskFormViewModel);

  Future<ResponseModel<Task>> update(TaskFormViewModel taskFormViewModel);

  Future<ResponseModel<bool>> delete(dynamic taskId);
}