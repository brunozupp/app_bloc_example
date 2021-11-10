import 'package:app_bloc_example/core/models/response_model.dart';
import 'package:app_bloc_example/domain/models/task.dart';

abstract class TaskRepository {

  Future<ResponseModel<List<Task>>> getAll();

  Future<ResponseModel<Task>> insert(Task task);

  Future<ResponseModel<Task>> update(Task task);

  Future<ResponseModel<bool>> deleteById(dynamic id);
}