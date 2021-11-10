import 'package:app_bloc_example/application/view_models/task_form_view_model.dart';
import 'package:app_bloc_example/core/models/response_model.dart';
import 'package:app_bloc_example/data/repositories/interfaces/task_repository.dart';
import 'package:app_bloc_example/domain/models/task.dart';
import 'package:app_bloc_example/domain/services/interfaces/task_service.dart';
import 'package:uuid/uuid.dart';

class TaskServiceImpl implements TaskService {

  final TaskRepository _taskRepository;

  TaskServiceImpl({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;
  
  @override
  Future<ResponseModel<bool>> delete(taskId) async {
    return await _taskRepository.deleteById(taskId);
  }

  @override
  Future<ResponseModel<List<Task>>> getAll() async {
    return await _taskRepository.getAll();
  }

  @override
  Future<ResponseModel<Task>> insert(TaskFormViewModel taskFormViewModel) async {
    
    if(!taskFormViewModel.validate()) {
      return ResponseModel.error(
        message: "As validações não foram atendidas"
      );
    }

    Task task = Task(
      id: const Uuid().v4(),
      name: taskFormViewModel.nameController.text,
      description: taskFormViewModel.descriptionController.text,
      priority: taskFormViewModel.priority!,
    );

    return await _taskRepository.insert(task);
  }

  @override
  Future<ResponseModel<Task>> update(TaskFormViewModel taskFormViewModel) async {
    
    if(!taskFormViewModel.validate()) {
      return ResponseModel.error(
        message: "As validações não foram atendidas"
      );
    }

    Task task = Task(
      id: taskFormViewModel.id,
      name: taskFormViewModel.nameController.text,
      description: taskFormViewModel.descriptionController.text,
      priority: taskFormViewModel.priority!,
    );

    return await _taskRepository.update(task);
  }

}