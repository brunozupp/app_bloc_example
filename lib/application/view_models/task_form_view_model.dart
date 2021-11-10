import 'package:app_bloc_example/domain/enums/priority.dart';
import 'package:app_bloc_example/domain/models/task.dart';
import 'package:flutter/material.dart';

import 'base_view_model.dart';

class TaskFormViewModel extends BaseViewModel {
  
  late final int? id;
  late int? userId; 
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  late Priority? priority;

  TaskFormViewModel({Task? task}) {
    nameController.text = task?.name ?? "";
    descriptionController.text = task?.description ?? "";
    priority = task?.priority;
  }

  String? validateName(String? value) {
    if(value == null || value.isEmpty) {
      return "Campo obrigatório";
    }

    return null;
  }

  String? validateDescription(String? value) {
    if(value == null || value.isEmpty) {
      return "Campo obrigatório";
    }

    if(value.length > 150) {
      return "Descrição deve possuir até 150 caracteres";
    }

    return null;
  }

  String? validatePriority(Priority? value) {
    if(value == null) {
      return "Campo obrigatório";
    }

    return null;
  }

}